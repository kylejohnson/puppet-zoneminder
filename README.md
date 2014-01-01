puppet-zoneminder
=================

## Overview
A puppet module to completely install ZoneMinder from source.
After running this module, you will have a working ZoneMinder install
from the lastest code in the master branch of the ZoneMinder GitHub repo.
This module was designed to run on a freshly installed, new Ubuntu server.

## Now Hear This - WARNING 
This puppet module was designed for one purpose:  To have modern ZoneMinder
up-and-running on a brand spanking new system very quickly.  This module does
not take into account:
 * Upgrading
 * Overwriting information if run on a server with an existing ZoneMinder install

## How to use
This module is designed to be used with a puppet solo install.  If you are already using puppet and have declared mysql, apache, or any of the other prerequisites defined in zoneminder::params, this module will fail to run due to resource declaration issues.

 1.  Install a fresh Ubuntu server.  I went with a minimal install, but a normal install will also work.
 2.  Configure network, SSH, whatever else.
 3.  Run the following code.
 4.  Pray.  Just kidding.  But seriously.  If something breaks, please report it to me (refer to the Troubleshooting / Getting Support section below)

```bash
sudo apt-get update && sudo apt-get install puppet git-core -y
git clone git://github.com/kylejohnson/puppet-zoneminder.git zoneminder
sudo puppet apply --verbose --modulepath=`pwd` -e 'include zoneminder'
```

## Platforms
 * Ubuntu 12.04
 * Ubuntu 13.04
 * Ubuntu 13.10

## Troubleshooting / Getting Support
 * I'm in #zoneminder on irc.freenode.net as fixxxermet.  Feel free to drop by and ask for help!

## Issues
 * I found a bug where ldconfig has not run in the right order, thus none of the zoneminder binaries will start.  After this  module runs, stop zoneminder, run ldconfig as root, and then start zoneminder.
 * Need to add checks for Ubuntu.  This module will probably fail misserably on a non-Ubuntu / Debian distro.
 * You will want to manually create a mysql root password after running this module, as the mysql root user does not have a password by default. 
