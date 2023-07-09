class httpd {
  class { 'caddy':
    version        => '2.6.4',
    install_method => 'github',
  }
  file { '/var/www':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
  }
}
