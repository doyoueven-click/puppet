# Sets up essential groups, sudo, and other baseline user stuff.
class dyec::user_install (
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
      ;
    'python3-pip':
      ensure => 'installed',
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
