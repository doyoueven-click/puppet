#!/bin/sh
# Updates the code and runs puppet
set -e
cd /etc/puppetlabs/code
export PATH=/opt/puppetlabs/puppet/bin:$PATH

if [ $NO_GIT != "true" ]; then
  git pull --ff-only --quiet
fi

librarian-puppet install --path /opt/puppetlabs/puppet/modules --verbose

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
