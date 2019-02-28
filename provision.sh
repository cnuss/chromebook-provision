#!/bin/sh

set -e
set -x

export DEBIAN_FRONTEND=noninteractive
BASE_REQS=/opt/base-reqs

if [ -z "$BASE_REQS" ]; then
  # Add Ansible repo
  echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

  # Install prereqs
  sudo apt-get update
  sudo apt-get -q -y install ansible git
  
  sudo git clone https://github.com/cnuss/chromebook-provision.git /opt/chromebook-provision
fi

touch "$BASE_REQS"

# Get this repo
cd /opt/chromebook-provision
sudo git pull

# Begin provisioning
sudo ansible-playbook /opt/chromebook-provision/ansible/provision.yml

exec $SHELL
