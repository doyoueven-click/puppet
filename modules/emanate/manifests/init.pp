# Invoke emanate, ensuring that the dotfiles repo is uptodate first
# @param repo The git repo containing the dotfiles
# @param source The local directory to clone the repo into
# @param destination The place to symlink dotfiles to
# @param user The user to execute as
# @param group The group to execute as
define emanate (
  String $repo,
  String $source,
  String $destination,
  String $user,
  String $group
) {
  require emanate::install
  vcsrepo { $source:
    ensure   => 'latest',
    provider => 'git',
    source   => $repo,
    owner    => $user,
    user     => $user,
    group    => $group,
  }
  -> exec { "/usr/local/bin/emanate --source ${source} --destination ${destination}":
    user  => $user,
    group => $group,
  }
}
