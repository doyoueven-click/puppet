class pkgs::php82 {
  package {
    'php8.2':
      ensure => 'latest',
      ;
    'php8.2-imagick':
      ensure => 'latest',
      ;
    'php8.2-mbstring':
      ensure => 'latest',
      ;
  }
}
