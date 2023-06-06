# Runtime

Since this is a "serverless" (no godbox) setup, it's up to us to define the loop.

Cron is used to trigger regular runs. The specifics of this job are managed by
puppetcode. Currently, it's set up to run every hour with a
host-specific offset.

Every run has three major steps:

1. Call `git` and update the code
2. Call `r10k` and update dependencies
3. Call `puppet apply` and actually configure the system

See `apply.sh` for the specifics.
