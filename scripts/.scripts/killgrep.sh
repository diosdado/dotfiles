#!/bin/bash

# finds all the processes that include in their name the string received and kills them
# stolen from https://dev.to/connorbode/the-best-way-to-kill-30ad

kill -9 $(ps aux | grep -i "$1" | grep -v grep | awk '{print $2}')


