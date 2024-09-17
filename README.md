![ci](https://github.com/devkyt/ansible-role-nomad/actions/workflows/ci.yml/badge.svg)

# Ansible Role: Nomad
Setup Hashicorp Nomad on RHEL and Debian servers.

## Requirements
 - Ansible >= 2.15
 - Run with ```become: true``` for a role or the entire playbook

## Variables
This role supports three variables:
```yaml
# Nomad version
version: 1.8.3

# Type of Nomad service
type: client

# Path to Nomad configuration file
config: /path/to/config/client.hcl

# Wait or not for Consul startup before run Nomad
wait_for_consul: false
```
Examples of configurations for both server and client can be found
in examples/config folder.

## How to Use
It's pretty straightforward. Just include role in a playbook:
```yaml
- hosts: all
  become: true
  roles:
    - role: devkyt.nomad
      vars:
        version: 1.19.1
        type: client
        config: /path/to/config/client.hcl
        wait_for_consul: false

```

## Author
Created by Kyrylo Tykhanskyi in the rainy September of 2024.
