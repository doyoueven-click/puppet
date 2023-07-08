# Sets up essential groups, sudo, and other baseline user stuff.
class dyec::user_install (
  # TODO: Options
) {
  require pkgs::python
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
      ;
    'vim':
      ensure=> 'installed',
      ;
    'git':
      ensure=> 'installed',
      ;
    'screen':
      ensure=> 'installed',
      ;
    'tmux':
      ensure=> 'installed',
      ;
    'di':
      ensure=> 'installed',
      ;
    'htop':
      ensure=> 'installed',
      ;
  }

  file { '/etc/sudoers.d/rsync':
    ensure  => 'file',
    content => ' %sudo ALL=(ALL) NOPASSWD:/usr/bin/rsync',
  }
}
