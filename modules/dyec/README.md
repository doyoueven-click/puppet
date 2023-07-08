# DYEC Common Code

Stuff in here should be more-or-less universal to all boxen in the system.

In most cases, you want to require `dyec::common`.

## Users

To add a new user:
1. Add a puppet file to the `dyec/manifests/users` directory
2. Add the user to the `requires` lines in `dyec/users/init.pp`
