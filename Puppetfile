#!/usr/bin/env ruby
#^syntax detection

forge "https://forgeapi.puppet.com"
#moduledir "/opt/puppetlabs/puppet/modules"
#moduledir "thirdparty"

# use dependencies defined in metadata.json

#mod 'puppetlabs-stdlib'
mod 'puppetlabs-vcsrepo', '6.1.0'

# puppet-caddy has Bugs and hasn't released since 2020
mod 'puppet-caddy',
  :git => 'https://github.com/doyoueven-click/puppet-caddy.git',
  :ref => 'fix-github'

# A module from git
# mod 'puppetlabs-ntp',
#   :git => 'git://github.com/puppetlabs/puppetlabs-ntp.git'

# A module from a git branch/tag
# mod 'puppetlabs-apt',
#   :git => 'https://github.com/puppetlabs/puppetlabs-apt.git',
#   :ref => '1.4.x'

# A module from Github pre-packaged tarball
# mod 'puppetlabs-apache', '0.6.0', :github_tarball => 'puppetlabs/puppetlabs-apache'
