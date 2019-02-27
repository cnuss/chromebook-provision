#!/bin/sh

set -e
set -x

export DEBIAN_FRONTEND=noninteractive

# Add Ansible repo
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

# Install prereqs
apt-get update
apt-get -q -y install ansible git

# Get this repo
git clone https://github.com/cnuss/chromebook-provision.git /opt/chromebook-provision 2> /dev/null || (cd /opt/chromebook-provision; git pull)

# Begin provisioning
ansible-playbook -K /opt/chromebook-provision/ansible/provision.yml
