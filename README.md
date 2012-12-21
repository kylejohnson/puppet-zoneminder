puppet-zoneminder
=================

## Overview
A puppet module to completely install ZoneMinder 1.25.0 from source.
The ZoneMinder source is patched with mastertheknife's performance patch, and nextime's plugin architecture patch, including his licence plate and facial recognition plugins.
After running this module, you will have a working ZoneMinder 1.25.0 install.

## How to use - Read Me First!
This module is designed to be used with a puppet solo install.  If you are already using puppet and have declared mysql, apache, or any of the other prerequisites defined in zoneminder::params, this module will fail to run due to resource declaration issues.

### Puppet Solo
 1.  Install a fresh Ubuntu 12.04 server.  I went with a minimal install, but a normal install will also work.
 2.  Configure network, SSH, whatever else.
 3.  apt-get update && apt-get install puppet git-core
 4.  git clone git://github.com/kylejohnson/puppet-zoneminder.git zoneminder
 5.  sudo puppet apply --verbose --modulepath=`pwd` -e 'include zoneminder'
 6.  Pray.  Just kidding.  But seriously.  If something breaks, please report it to me (refer to the Troubleshooting / Getting Support section below)

## Platforms
 * Ubuntu 12.04

## Troubleshooting / Getting Support
 * I'm in #zoneminder on irc.freenode.net as fixxxermet.  Feel free to drop by and ask for help!

## Issues
 * Need to add checks for Ubuntu.  This will probably fail misserably on ! Ubuntu
 * Should I use fastcgi and nginx?
 * You will want to manually create a mysql root password after running this module, as the mysql root user does not have a password by default. 
