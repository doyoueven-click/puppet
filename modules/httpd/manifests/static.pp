# Set up a static site with caddy
# @param hostname The vhost FQDN
# @param webroot The directory to use as the webroot
define httpd::static (
  String $hostname = $title,
  String $webroot,
) {
  require caddy
  file { $webroot:
    ensure => 'directory',
  }
  -> caddy::vhost { $hostname:
    content => "
    ${hostname} {
      root * ${webroot}
      file_server browse 
    }",
  }
}
