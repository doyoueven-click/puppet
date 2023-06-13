# Manages the puppet installation itself
class dyec::puppet {
  # Run puppet periodically
  cron { 'puppet apply':
    command => '/etc/puppet/code/apply.sh',
    user    => 'root',
    minute  => fqdn_rand(60, "puppet apply"),
  }
  # TODO: Also run puppet apply on reboot

  service { 'puppet-agent':
    ensure => 'stopped',
    enable => false,
  }
}
