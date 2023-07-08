class emanate::install {
  require pkgs::python
  Package['python3']
  -> file { '/usr/local/bin/emanate':
    source => 'https://github.com/duckinator/emanate/releases/download/v7.0.0/emanate-7.0.0.pyz',
    owner  => 'root',
    group  => 'root',
    mode   => 'u=rwx,g=rx,o=rx'
  }
}
