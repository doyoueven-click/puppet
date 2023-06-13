# The universal class that should be included in everything.
class dyec::common {
  require dyec::puppet
  require dyec::user_install

  dyec::admin {
    'astraluma':
      fullname   => 'Jamie Bliss'
      sshkeys_ed => {
        "cardno:000612285692" => "AAAAC3NzaC1lZDI1NTE5AAAAINEgcvdotsdIAp0s6uqQI/p+EYUAUVscL2w5K1cmJDG6"
      }
    ;
    'agmlego':
      fullname   => 'Amelia Meyer',
      # ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAF1VHoPjBIMgdWLNF0UfK2ndSTfw02EFviiikT468mHJlEGQlYR+GDx3n5ffSM95DaHlg0tp2GOzw8abt9QxIYdrQHMfePKMiLfHATL6wJN5uwKRd3O1cggfXU6HZqTltleeBXidk6F8hQyhL9rd1I/r1Oxj6HQdyB2vVICxjoQi7or4Q== juicessh@oneplus7t
      sshkeys_ed => {
        "inanna"             => "AAAAC3NzaC1lZDI1NTE5AAAAIDF2jQHtDMUz84Ul644Nf6nqeI7tedN0eRmjys8JrSgK",
        "agmlego@PERSEPHONE" => "AAAAC3NzaC1lZDI1NTE5AAAAIN6iK3W4imsyJqlcZwmhdcNp6elpkYryEULvJxXKtP3Q",
        "enedina"            => "AAAAC3NzaC1lZDI1NTE5AAAAIIxULzQqLX7m9IEiWh/EdejyNi+i5i0sTVaXW2wdhafl",
      },
    ;
    'nicoo':
      fullname   => 'nicoo',
      sshkeys_ed => {
        "neon" => "AAAAC3NzaC1lZDI1NTE5AAAAIEPefie/fg02FIqUJ+wgEe9OmECEcfyW6EPKo4x1AWfK",
      }
    ;
  }
  # TODO: User-specific configurations
}
