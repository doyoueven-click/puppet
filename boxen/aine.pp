require dyec::common
httpd::static { 'pintailsailing.org':
  webroot => '/var/www/pintailsailing.org',
}

# install dokuwiki for Factorio
httpd::dokuwiki { 'wiki.sithsite.space':
  webroot => '/var/www/wiki.sithsite.space',
  release => 'release-2023-04-04a',
}
