class pkgs::python {
  package {
    'python3':
      ensure => 'installed',
    ;
    'python3-pip':
      ensure => 'installed',
    ;
    'python3-venv':
      ensure => 'installed',
  }
}
