bootstrap HOST:
# FIXME: run as root
  cat bootstrap.sh | ssh {{HOST}} /bin/sh
