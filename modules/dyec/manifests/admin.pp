# An admin user, with all the fixins
define dyec::admin(
  String $username = $title,
  String $fullname,
  Hash[String, String] $sshkeys_ed = {},
) {
  group { $username:
    ensure => present,
    system => false,
  }
  -> user { $username:
    ensure     => present,
    comment    => $fullname,
    group      => $username,
    groups     => [
      'admin',
      'sudo'
    ],
    home       => "/home/$username",
    managehome => true,
    # shell => ...,
    system     => false,
  }

  $sshkeys_ed.each |$comment, $key| {
    User[$username] -> ssh_authorized_key { $comment:
      ensure => present,
      user   => $username,
      type   => 'ssh-ed25519',
      key    => $key,
    }
  }
  
}
