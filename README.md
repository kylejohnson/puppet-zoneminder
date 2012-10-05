puppet-zoneminder
=================

## Overview

A puppet module to completely install ZoneMinder 1.25.0 from source.
The ZoneMinder source is patched with mastertheknife's performance patch, and nextime's plugin architecture patch, including his licence plate and facial recognition plugins.


## Platforms
 * Ubuntu 12.04

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
