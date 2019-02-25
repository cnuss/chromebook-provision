#!/bin/sh

set -e
set -x

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -q -y install puppet git

git clone https://github.com/cnuss/chromebook-provision.git /opt/chromebook-provision || true
rm -fr /etc/puppet
ln -s /opt/chromebook-provision/etc/puppet /etc/puppet

pushd /etc/puppet
git pull
popd

#puppet apply /etc/puppet/manifests/site.pp
