# Adopting a New Box

Congratulations! You have a bouncing baby box! Or maybe an old box you want to
induct Puppet into. Here's how to do it!

## Step 0: Prerequisites

This process assumes that on your workstation, you have:

- A checkout of this repo
- Functioning SSH to the box (password is fine) with scp
- [just](https://just.systems/)

On the remote host you wish to install Puppet on, you need:

- An OS (We currently strongly prefer Debian)
  - Please setup to use sudo instead of a root password
- Functioning SSH with scp

## Step 1: Add a Boxen File

The Puppet entrypoints are kept in the `boxen/` directory. In there, you will
find files in the form of `<HOSTNAME>.pp`, each of which defines what goes on
that specific box.

The actual Puppet code contained in these files should be kept minimal, instead
using modules for the details. The things in the boxen files should be things
like `require`/`include` to pull in modules, or `class {}` to give box-specific
parameters.

If you're not sure what to put in a boxen file, just do this:

    require dyec::common

This will apply just the baseline configuration.

Be sure to commit and push after you've written the boxen file.

## Step 2: Bootstrap Puppet

The second part is to actually install Puppet and get it going. On your
workstation, run the command:

    just bootstrap <HOSTNAME>

This will SSH into the box, copy the bootstrap script, and run it as root. The
script will install Puppet and dependencies, set up some repos, and run Puppet
for the first time. When it is finsihed, Puppet is completely installed and
running autonomously.
