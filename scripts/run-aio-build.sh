#!/bin/bash

set -o xtrace

# Install basic packages for this script.
apt-get update
apt-get -y install git

# GIT clone our playbook to CWD.
git clone --recursive https://github.com/pantarei/ansible-playbook-bitbucket.git /opt/ansible-playbook-bitbucket
cd /opt/ansible-playbook-bitbucket

# Bootstrap Ansible then run all playbooks.
scripts/bootstrap-ansible.sh
scripts/bootstrap-roles.sh
scripts/bootstrap-group_vars.sh
scripts/bootstrap-inventory.sh
ansible-playbook -i inventory/localhost playbooks/run-aio-build.yml
