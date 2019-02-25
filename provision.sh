#!/bin/sh

set -e
set -x

export DEBIAN_FRONTEND=noninteractive
export PWD=$(pwd)

sudo apt-get update
sudo apt-get -q -y install puppet git

git clone https://github.com/cnuss/chromebook-provision.git /opt/chromebook-provision 2> /dev/null || (cd /opt/chromebook-provision; git pull)
rm -fr /etc/puppet
ln -s /opt/chromebook-provision/etc/puppet /etc/puppet

cd /etc/puppet
puppet apply /etc/puppet/manifests/site.pp

cd "$PWD"
