set windows-shell := ["powershell", "-c"] # To use PowerShell Desktop instead of Core on Windows

# Show this help
help:
  @just --list

# Install puppet onto a host
bootstrap HOST:
  scp bootstrap.sh {{HOST}}:/tmp/bootstrap.sh
  ssh -t {{HOST}} sudo sh /tmp/bootstrap.sh

# Copy the code to a host and run puppet. Note that this only works if passwordless sudo is set up.
ship HOST:
  rsync --rsync-path="sudo rsync" -avz --exclude .git --exclude .tmp . {{HOST}}:/etc/puppetlabs/code
  ssh -t {{HOST}} sudo NO_GIT=true /etc/puppetlabs/code/apply.sh

# Undo shipping, restoring it to production state
unship HOST:
  ssh -t {{HOST}} sudo git -C /etc/puppetlabs/code reset --hard

# Run puppet on a host
apply HOST:
  ssh -t {{HOST}} sudo /etc/puppetlabs/code/apply.sh

# Show the docs in a nice local viewer
docs:
  frogmouth docs
