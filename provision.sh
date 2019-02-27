#!/bin/sh

set -e
set -x

export DEBIAN_FRONTEND=noninteractive

deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
apt-get update
apt-get -q -y install ansible git

git clone https://github.com/cnuss/chromebook-provision.git /opt/chromebook-provision 2> /dev/null || (cd /opt/chromebook-provision; git pull)

ansible-playbook -K /opt/chromebook-provision/ansible/provision.yml
