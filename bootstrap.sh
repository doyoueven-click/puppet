#!/bin/sh
# Bootstraps Puppet and runs the initial configuration pass
set -euox
# NOTE: This must be all in one file and it needs to install any dependencies itself.

# Ok, so, the bootstrap process:
# 1. Install the prerequisites from apt
# 2. Install puppet and r10k
# 3. Clone the puppet repo
# 4. Run apply

# FIXME: Pull the code name (bullseye, buster, stretch) for the system
# source /etc/os-release
VERSION_CODENAME=bullseye

apt-get install -y git wget

# Puppet-release only covers the apt repo, puppet-agent is the actual software
wget https://apt.puppet.com/puppet8-release-$VERSION_CODENAME.deb -O /tmp/puppet.deb
apt-get install /tmp/puppet.deb
apt-get update
apt-get install puppet-agent

/opt/puppetlabs/puppet/bin/gem install r10k

mkdir -p /etc/puppetlabs
rm -rf /etc/puppetlabs/code
git clone https://github.com/doyoueven-click/puppet.git /etc/puppetlabs/code

/etc/puppetlabs/code/apply.sh
