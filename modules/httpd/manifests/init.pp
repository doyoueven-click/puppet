class httpd {
  include caddy
  file { '/var/www':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
  }
}
