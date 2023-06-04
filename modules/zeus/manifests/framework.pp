# Hardware support for the framework
class zeus::framework {
  # FIXME: Use the apt module when it's updated for 8
  file { '/etc/apt/sources.list':
    content => file('zeus/sources.list'),
  }
  ~> exec { '/usr/bin/apt-get update': }

  package { 'firmware-realtek': 
    ensure => 'latest',
  }
}
