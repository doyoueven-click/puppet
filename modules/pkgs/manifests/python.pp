class pkgs::python {
  package {
    'python3':
      ensure => 'latest',
    ;
    'python3-pip':
      ensure => 'latest',
    ;
    'python3-venv':
      ensure => 'latest',
  }
}
