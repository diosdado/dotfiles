#!/usr/bin/env bash

killall Finder
find ~/Desktop/Projects/Development/MountedSSH -mindepth 1 -maxdepth 1 -type d -exec umount {} \;
