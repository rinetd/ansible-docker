#!/bin/sh

export docker_version=18.06.1-ce
export docker_compose_version=1.22.0

echo "\n建议直接下载本人打包好的所有必要二进制包docker-***.all.tar.gz，然后解压到bin目录"
echo "\n建议不使用此脚本，如果你想升级组件或者实验，请通读该脚本，必要时适当修改后使用"
echo "\n注意1：请按照以下链接手动下载二进制包到down目录中"
echo "\n注意2：如果还没有手工下载tar包，请Ctrl-c结束此脚本"

echo "\n----download docker binary at:"
echo https://download.docker.com/linux/static/stable/x86_64/docker-${docker_version}.tgz
[ -e docker-${docker_version}.tgz ] || curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/docker-${docker_version}.tgz
echo "\n----download docker-compose at:"
echo https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-Linux-x86_64
echo https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-Linux-x86_64.sha256

[ -e docker-compose-Linux-x86_64 ] || curl -sSL -O https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-Linux-x86_64
[ -e docker-compose-Linux-x86_64.sha256 ] || curl -sSL -O https://github.com/docker/compose/releases/download/${docker_compose_version}/docker-compose-Linux-x86_64.sha256

sleep 1


### 准备docker程序
echo "\n准备docker二进制程序..."
if [ -f "docker-${docker_version}.tgz" ]; then
  echo "\nextracting docker binaries..."
  sha256sum -c docker-${docker_version}.tgz.sha256 && {
    tar zxf docker-${docker_version}.tgz
    mv -f docker/docker* ../bin
    if [ -f "docker/completion/bash/docker" ]; then
      mv -f docker/completion/bash/docker ../files/docker
    fi    
  }
else
  echo 请先下载docker-${docker_version}.tgz
fi

### 准备docker-compose程序
echo "\n准备docker-compose二进制程序..."
if [ -f "docker-compose-Linux-x86_64" ]; then
  echo "\nextracting docker-compose binaries..."
  sha256sum -c docker-compose-Linux-x86_64.sha256 && {
    chmod +x docker-compose-Linux-x86_64
    cp -f docker-compose-Linux-x86_64 ../bin/docker-compose
  }
else
  echo 请先下载docker-compose
fi