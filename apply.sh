#!/bin/sh
# Updates the code and runs puppet
set -euo
cd /etc/puppetlabs/code
export PATH=/opt/puppetlabs/puppet/bin:$PATH

git pull --ff-only

# FIXME: r10k

# FIXME: Add a debug option to enable graphs & catalog summary
# FIXME: Log to console on bootstrap
# This is currently configured for maximum debugging and parsing.
# We can probably reduce this flag set.
puppet apply \
  --verbose \
  --logdest console,/var/log/puppet.log,/var/log/puppet.jsonl \
  --write-catalog-summary \
  --graph \
  --strict warning \
  --summarize \
  # --detailed-exitcodes \
  ./boxen/$(hostname -s).pp
