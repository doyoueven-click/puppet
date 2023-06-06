# Entrypoint for nodes of the Zeus cluster.
class zeus {
  require dyec::common

  require zeus::framework

  file { '/tmp/hello':
    content => "hello world"
  }
}
