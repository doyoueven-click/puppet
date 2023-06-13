# Sets up essential groups, sudo, and other baseline user stuff.
class user_install(
  # TODO: Options
) {
  package {
    'zsh':
      ensure => 'latest',
    ;
    'sudo':
      ensure => 'latest',
    ;
    'passwd':
      ensure => 'latest',
    ;
  }

  # Note that debian ships with a sudo group that allows for password sudo
  group { 'admin':
   ensure => 'present',
  }

  file { '/etc/sudoers.d/admin':
    ensure => 'present',
    contents => ' %admin ALL=(ALL) NOPASSWD:ALL',
  }
}