class emanate::install {
  package { 'python3-pip':
    ensure=> 'installed',
  }
  -> package { 'emanate':
    ensure   => 'installed',
    provider => 'pip3',
  }
}
