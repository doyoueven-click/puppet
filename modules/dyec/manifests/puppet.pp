# Manages the puppet installation itself
class puppet {
  # Run puppet periodically
  cron { 'puppet apply':
    command => '/etc/puppet/code/apply.sh',
    user    => 'root',
    minute  => fqdn_rand(60, "puppet apply"),
  }
}