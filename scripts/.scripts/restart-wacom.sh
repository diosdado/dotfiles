#!/bin/bash

killall Wacom_IOManager
killall WacomTabletDriver
killall Wacom\ Center



/opt/homebrew/bin/terminal-notifier -message "Wacom Services Restarted" -title "Wacom"



