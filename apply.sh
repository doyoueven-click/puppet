#!/bin/sh
# Updates the code and runs puppet
set -eu
cd /etc/puppetlabs/code
export PATH=/opt/puppetlabs/puppet/bin:$PATH

git pull --ff-only --quiet

# FIXME: r10k

# FIXME: Add a debug option to enable graphs & catalog summary
# FIXME: Log to console on bootstrap
# TODO: --detailed-exitcodes
# This is currently configured for maximum debugging and parsing.
# We can probably reduce this flag set.
puppet apply \
  --verbose \
  --logdest console,/var/log/puppet.log,/var/log/puppet.jsonl \
  --write-catalog-summary \
  --graph \
  --strict warning \
  --summarize \
  ./boxen/$(hostname -s).pp
