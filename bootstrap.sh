#!/bin/sh
# Bootstraps Puppet and runs the initial configuration pass
set -euo
# NOTE: This must be all in one file and it needs to install any dependencies itself.

source /etc/os-release

apt-get install git wget

wget https://apt.puppet.com/puppet8-release-$VERSION_CODENAME.deb -O /tmp/puppet.deb
apt-get install /tmp/puppet.deb

git clone https://github.com/doyoueven-click/puppet.git <DIRECTORY>

exec ./apply.sh
