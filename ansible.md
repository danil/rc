# Ansible

## Install

    apt-get install python
    pip2 install --user "ansible>=2.4"

## SSH

    ansible-playbook --private-key=path/to/file.pem your_playbook.yml

### Disable SSH fingerprint check

    ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook your_playbook.yml

## Inventory

    ansible-playbook --inventory=inventories/local your_playbook.yml

## Variables

For example provide value for variable `timestamp`
which may be used for temporary files names.

    ansible-playbook --extra-vars="timestamp=$(date --utc +%Y%m%dT%H%M%SZ)" path/to/your_playbook.yml

## Tags

Run one task from playbook

    ansible-playbook --tags=tag_name path/to/your_playbook.yml

## Hosts

Limit playbook to a single host

    ansible-playbook --limit=your_host_alias path/to/your_playbook.yml

## Modules

Ansible modules <http://docs.ansible.com/ansible/modules_by_category.html>

### User

<http://docs.ansible.com/ansible/user_module.html>

#### Password

Make hashed user password

    mkpasswd --method=sha-512
