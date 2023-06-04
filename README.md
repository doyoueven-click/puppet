# puppet

Main puppet config repo.

Currently this only supports Debian systems.

## Repo Layout

- `boxen/`: Puppet entrypoints for each individual box, by host basename. Minimal
  actual code should be in here, instead simply doing requires.
- `modules/`: Local puppet modules, should be the bulk of the "meaningful"
  code.
- `apply.sh`: The execution entry point to update everything and perform a puppet run.
- `bootstrap.sh`: Script to instantiate puppet on a fresh system. Should be
  invoked with `just bootstrap $HOSTNAME`

## Host layout

- `/etc/puppetlabs/code`: The home of this repo on a managed system (ie codedir and modulepath)
- `/opt/puppetlabs/puppet`: The installation directory of the puppet package

More info can be found in at [Directories and files in the puppet docs](https://www.puppet.com/docs/puppet/8/dirs_important_directories.html)

## Known Deficiencies

- Absolutely no secrets story
- Deep hiera
