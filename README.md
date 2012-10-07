puppet-zoneminder
=================

## Overview
A puppet module to completely install ZoneMinder 1.25.0 from source.
The ZoneMinder source is patched with mastertheknife's performance patch, and nextime's plugin architecture patch, including his licence plate and facial recognition plugins.

## How to use - Read Me First!
This module is designed to be used with a standalone puppet master, or with a puppet solo install.  If you are already using puppet and have declared mysql, apache, or any of the other prerequisites defined in zoneminder::params, this module will fail to run due to resource declaration issues.

You will also want to manually create a mysql root password after running this module, as the mysql root user does not have a password by default. 

## Platforms
 * Ubuntu 12.04

## Troubleshooting / Getting Support

## Issues
 * Should I install ffmpeg from source, or from the package repo?  Does the repo version of ffmpeg even work?
     * From source is working
 * Need to add checks for Ubuntu.  This will probably fail misserably on ! Ubuntu
 * Should I use fastcgi and nginx?
 * I should move the different install sections to subclasses (what are they called again?)
     * Moved them to separate classes.  Much cleaner this way.
 * I should move the libjpeg deb to module, so it doesn't rely on a mirror
     * Moved to the libjpeg-turbo8 and libjpeg-turbo8-dev patches
 * Need to setup a config::database class and config::apache class before this module can be called complete.
