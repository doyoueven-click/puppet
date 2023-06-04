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
- Puppet status reporting

## Runtime

Since this is a "serverless" (no godbox) setup, it's up to us to define the loop.

Cron is used to trigger regular runs. The specifics of this job are managed by
puppetcode. Currently, it's set up to run every twenty minutes with a
host-specific offset.

Every run has three major steps:

1. Call `git` and update the code
2. Call `r10k` and update dependencies
3. Call `puppet apply` and actually configure the system

See `apply.sh` for the specifics.

## Deploying changes

Change management is done through the forge UI (ie, through GitHub pull
requests). When merged, new code will be picked up and applied to each server
as they run their updates. That means that changes can take twenty minutes to
apply, and neither deployment nor puppet status is reported to GitHub.
