# Install puppet onto a host
bootstrap HOST:
  scp bootstrap.sh {{HOST}}:/tmp/bootstrap.sh
  ssh -t {{HOST}} sudo sh /tmp/bootstrap.sh

# Copy the code to a host and run puppet
# Note that this only works if passwordless sudo is set up
ship HOST:
  rsync --rsync-path="sudo rsync" -avz . {{HOST}}:/etc/puppetlabs/code
  ssh -t {{HOST}} sudo NO_GIT=true /etc/puppet/code/apply.sh
