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
      ensure=> 'latest',
      ;
    'git':
      ensure=> 'latest',
      ;
    'screen':
      ensure=> 'latest',
      ;
    'tmux':
      ensure=> 'latest',
      ;
    'di':
      ensure=> 'latest',
      ;
    'htop':
      ensure=> 'latest',
      ;
    'molly-guard':
      ensure => 'latest',
      ;
  }

  file { '/etc/sudoers.d/rsync':
    ensure  => 'file',
    content => ' %sudo ALL=(ALL) NOPASSWD:/usr/bin/rsync',
  }
}
