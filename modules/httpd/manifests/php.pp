# Set up a PHP site with caddy
# @param hostname The vhost FQDN
# @param webroot The directory to use as the webroot
# @param user The user to own the files
# @param group The group to own the files
define httpd::php (
  String $hostname = $title,
  String $webroot,
  String $php_version,
  String $user = 'www-data',
  String $group = 'www-data',
) {
  if $php_version == '8.2' {
    $php_sock = '/run/php/php8.2-fpm.sock'
    require pkgs::php82
  }
  include caddy
  file { $webroot:
    ensure => 'directory',
    owner  => $user,
    group  => $group,
    mode   => 'a+r',
  }
  -> caddy::vhost { $hostname:
    content => "
    ${hostname} {
      root * ${webroot}
      php_fastcgi ${php_sock}
    }",
  }
}
