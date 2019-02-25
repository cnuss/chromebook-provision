#!/bin/sh

set -e
set -x

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -q -y install puppet git
