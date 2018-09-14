# ansible-docker

[![Build Status](https://travis-ci.org/rinetd/ansible-docker.svg?branch=master)](https://travis-ci.org/rinetd/ansible-docker)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-rinetd.docker-blue.svg)](https://galaxy.ansible.com/rinetd/docker/)
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/rinetd/ansible-docker.svg)](http://isitmaintained.com/project/rinetd/ansible-docker "Average time to resolve an issue")
[![Percentage of issues still open](http://isitmaintained.com/badge/open/rinetd/ansible-docker.svg)](http://isitmaintained.com/project/rinetd/ansible-docker "Percentage of issues still open")

This Ansible role performs basic download [docker](https://download.docker.com/linux/static/stable/x86_64/)
installation, including filesystem structure, and example configuration.

## Requirements

This role requires a Debian, RHEL, or Ubuntu distribution; the role is tested
with the following specific software versions:

* Ansible: 2.6.0
* CentOS: 7
* Debian: 8
* RHEL: 7
* Ubuntu: 16.04

## Install

1. download docker bin
  `sh down/download.sh`
2. config hosts vars
  `vi hosts`
3. execute ansible deploy
  `ansible-playbook -i host 01.docker.yml `
  
## Role Variables

The role defines most of its variables in `defaults/main.yml`:

### `docker_version`

- docker version to install
- Default value: **18.06.1-ce**


### `docker_bin_dir`

- docker binary installation path
- Default value: `/usr/local/bin`

### `docker_config_dir`

- docker configuration file path
- Default value: `/etc/docker.d`

### `docker_data_dir`

- docker data path
- Default value: `/var/docker`

### `docker_lockfile`

- docker lockfile path
- Default value: `/var/lock/docker`

### `docker_log_dir`

- docker log path
- Default value: `/var/log/docker`

### `docker_run_dir`

- docker run path
- Default value: `/var/run/docker`

### `docker_user`

- docker OS username
- Default value: **root**

### `docker_group`

- docker OS group
- Default value: **bin**

### `docker_log_level`

- Logging level
- Default value: **INFO**

### `docker_syslog_enable`

- Log to syslog
- Default value: **true**

### `docker_iface`

- docker network interface
- Default value: `{{ ansible_default_ipv4.interface }}`

### `docker_options`

- Driver options
- Key value dict
- Default value: **{}**

### `docker_meta`

- Meta data
- Key value dict
- Default value: **{}**

### `docker_bind_address`

- Bind interface address
- Default value: `{{ hostvars[inventory_hostname]['ansible_'+ docker_iface ]['ipv4']['address'] }}` 

### `docker_ports`

- Ports used by docker
- Default value: `http: {{ docker_ports_http }}, rpc: {{ docker_ports_rpc }}, serf: {{ docker_ports_serf }}`

### `docker_key_file`

- Use a key for tls connection, docker_cert_file and docker_key_file are needed
- Default value: **""**

#### Custom Configuration Section

## Dependencies

Ansible requires GNU tar and this role performs some local use of the
unarchive module, so ensure that your system has `gtar`/`unzip` installed.
Jinja2 templates use ipaddr filter that need `netaddr` python library.

## Example Playbook

Basic docker installation is possible using the included `site.yml` playbook:

```
ansible-playbook -i <hosts> site.yml
```

You can also simply pass variables in using the `--extra-vars` option to the
`ansible-playbook` command:

```
ansible-playbook -i hosts site.yml --extra-vars "docker_users=maui"
```

### Vagrant and VirtualBox

See `examples/README_VAGRANT.md` for details on quick Vagrant deployments
under VirtualBox for testing, etc.

## License

BSD

## Author Information

[pytool](http://blog.pytool.com)

## Contributors

Special thanks to the folks listed in [CONTRIBUTORS.md](https://github.com/rinetd/ansible-docker/blob/master/CONTRIBUTORS.md) for their
contributions to this project.

Contributions are welcome, provided that you can agree to the terms outlined
in [CONTRIBUTING.md](https://github.com/rinetd/ansible-docker/blob/master/CONTRIBUTING.md)
