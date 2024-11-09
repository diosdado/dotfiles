#!/bin/bash

# used for web development
# switches to browser used for development and executes a key combination to delete history and refresh the current tab

sendkeys --application-name "Vivaldi" --characters "<c:r:command,shift><c:r:command>"

