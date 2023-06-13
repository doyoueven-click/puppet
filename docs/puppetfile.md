# Puppetfile & Dependencies

Puppet has an extensive ecosystem of third-party modules on
[Puppetforge](https://forge.puppet.com/). Which modules to download and use is
managed by the `Puppetfile`.

[r10k docs: Puppetfile](https://github.com/puppetlabs/r10k/blob/main/doc/puppetfile.mkd)

Note that this repo uses [librarian-puppet](https://github.com/voxpupuli/librarian-puppet),
not r10k, because it supports dependency resolution and lockfiles.

To install additional modules, copy the `mod '...'` line from the forge page into
`Puppetfile`.

**Note**: Lockfile tools aren't formalized yet. Neither is dependency upgrading.

Additionally, modules from git and tarball are also supported. See the librarian-puppet
docs for further information.
