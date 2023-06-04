class zeus {
  require dyec::common
  file { '/tmp/hello':
    content => "hello world"
  }
}
