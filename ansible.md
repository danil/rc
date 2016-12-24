# Ansible

## Install

    pip2 install --user git+git://github.com/ansible/ansible.git@stable-2.2

## SSH

    ansible-playbook --private-key=path/to/file.pem your_playbook.yml

### Disable SSH fingerprint check

    ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook your_playbook.yml

## Inventory

    ansible-playbook --inventory=inventories/local your_playbook.yml

## Variables

For example provide value for variable `timestamp`
which may be used for temporary files names.

    ansible-playbook --extra-vars="timestamp=$(date --utc +%Y%m%dT%H%M%SZ)" perf.yml

## Tags

Run one task from playbook

    ansible-playbook --tags=tag_name your_playbook.yml
