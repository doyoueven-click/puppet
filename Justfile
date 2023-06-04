bootstrap HOST:
  scp bootstrap.sh {{HOST}}:/tmp/bootstrap.sh
  ssh -t {{HOST}} sudo sh /tmp/bootstrap.sh
