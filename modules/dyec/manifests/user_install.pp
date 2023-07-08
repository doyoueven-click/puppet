# Sets up essential groups, sudo, and other baseline user stuff.
class dyec::user_install(
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
    'rsync':
      ensure => 'latest',
  }

  file { '/etc/sudoers.d/rsync':
    ensure  => 'present',
    content => ' %sudo ALL=(ALL) NOPASSWD:/usr/bin/rsync',
  }
}
