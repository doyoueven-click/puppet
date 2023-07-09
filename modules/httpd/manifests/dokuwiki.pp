# Set up a dokuwiki site with caddy
# @param hostname The vhost FQDN
# @param webroot The directory to use as the webroot
# @param user The user to own the files
# @param group The group to own the files
define httpd::dokuwiki (
  String $hostname = $title,
  String $webroot,
  String $release,
  String $user = 'www-data',
  String $group = 'www-data',
) {
  require pkgs::php82
  include httpd

  $php_sock = '/run/php/php8.2-fpm.sock'
  file { $webroot:
    ensure => 'directory',
    owner  => $user,
    group  => $group,
    mode   => 'a+r',
  }
  if find_file("${webroot}/conf/local.php") {
    # installer has been run, make the sensitive bits safe
    $forbidden_block = "
    @forbidden path /data/* /conf/* /bin/* /inc/* /install.php
    handle @forbidden {
        respond * 403
    }"
  } else {
    $forbidden_block = ''
  }
  File[$webroot] -> caddy::vhost { $hostname:
    content => "${hostname} {

    encode gzip zstd
    root * ${webroot}

    ${forbidden_block}
 
    try_files {path} {path}/index.html

    route {
        handle_path /_media/* {
            rewrite * /lib/exe/fetch.php?media={path}&{query}    
        }
        handle_path /_detail/* {
            rewrite * /lib/exe/detail.php?media={path}&{query}
        }        
        handle /_export/* {
            @export path_regexp export ^/_export/([^/]+)/(.*)
            rewrite @export /doku.php?do=export_{re.export.1}&{query}&id={re.export.2}
        }
        handle / {
            rewrite * /doku.php?{query}
        }
        try_files {path} /doku.php?id={path}&{query}
    }

    file_server
    php_fastcgi ${php_sock}
}",
  }
  vcsrepo { $webroot:
    ensure   => 'present',
    revision => $release,
    provider => 'git',
    source   => 'https://github.com/dokuwiki/dokuwiki.git',
    owner    => $user,
    user     => $user,
    group    => $group,
  }
}
