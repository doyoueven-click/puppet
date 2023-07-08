# Set up a static site with caddy
# @param hostname The vhost FQDN
# @param webroot The directory to use as the webroot
# @param user The user to own the files
# @param group The group to own the files
define httpd::static (
  String $hostname = $title,
  String $webroot,
  String $user = 'www-data',
  String $group = 'www-data',
) {
  require caddy
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
      file_server browse 
    }",
  }
}
