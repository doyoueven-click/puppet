class dyec::users::agmlego {
  dyec::admin {
    'agmlego':
      fullname   => 'Amelia Meyer',
      # ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAF1VHoPjBIMgdWLNF0UfK2ndSTfw02EFviiikT468mHJlEGQlYR+GDx3n5ffSM95DaHlg0tp2GOzw8abt9QxIYdrQHMfePKMiLfHATL6wJN5uwKRd3O1cggfXU6HZqTltleeBXidk6F8hQyhL9rd1I/r1Oxj6HQdyB2vVICxjoQi7or4Q== juicessh@oneplus7t
      sshkeys_ed => {
        'inanna'             => 'AAAAC3NzaC1lZDI1NTE5AAAAIDF2jQHtDMUz84Ul644Nf6nqeI7tedN0eRmjys8JrSgK',
        'agmlego@PERSEPHONE' => 'AAAAC3NzaC1lZDI1NTE5AAAAIN6iK3W4imsyJqlcZwmhdcNp6elpkYryEULvJxXKtP3Q',
        'enedina'            => 'AAAAC3NzaC1lZDI1NTE5AAAAIIxULzQqLX7m9IEiWh/EdejyNi+i5i0sTVaXW2wdhafl',
      },
  }
  -> emanate { '/home/agmlego':
    repo   => 'git@github.com:agmlego/dotfiles.git',
    source => '/home/agmlego/dotfiles',
    user   => 'agmlego',
    group  => 'agmlego',
  }
}
