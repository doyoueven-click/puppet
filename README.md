# puppet

Main puppet config repo.

Currently this only supports Debian systems.

More extensive documentation can be found in the [docs folder](./docs/README.md).

## Repo Layout

- `docs/`: A pile of markdown talking about tools, processes, and puppet itself.
- `boxen/`: Puppet entrypoints for each individual box, by host basename. Minimal
  actual code should be in here, instead simply doing requires.
- `modules/`: Local puppet modules, should be the bulk of the "meaningful"
  code.

In addition, some of the important files are

- `apply.sh`: The execution entry point to update everything and perform a puppet run.
- `bootstrap.sh`: Installs and initializes Puppet. See [Adopting a New Box](docs/adoption.md).
- `Justfile`: Commands for people working in this repo, using [just](https://just.systems/).
- `Puppetfile`: Dependencies of puppet, see [Puppet & Dependencies](docs/puppetfile.md).
- `README.md`: This file

## Host layout

- `/etc/puppetlabs/code`: The home of this repo on a managed system (ie codedir and modulepath)
- `/opt/puppetlabs/puppet`: The installation directory of the puppet package
- `/var/log/puppet.log`: The output from the most recent run

More info can be found in at [Directories and files in the puppet docs](https://www.puppet.com/docs/puppet/8/dirs_important_directories.html)

## Known Deficiencies

- Absolutely no secrets story
- Deep hiera
- Puppet status reporting
- Bulk file deployment

## Deploying changes

Change management is done through the forge UI (ie, through GitHub pull
requests). When merged, new code will be picked up and applied to each server
as they run their updates. That means that changes can take an hour to
apply, and neither deployment nor puppet status is reported to GitHub.

## Development

The entrypoint for human commands is [just](https://just.systems/).

Just commands should be run from a code checkout on your workstation.

### Send your code to a box

tl;dr: `just ship HOSTNAME`

You can "ship" your local workspace to a host and have it try to apply it. Note
that the host must have already been bootstrapped.

To restore a host to production state. use `just unship HOSTNAME`.
