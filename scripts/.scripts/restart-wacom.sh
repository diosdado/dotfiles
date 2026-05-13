#!/bin/bash

killall Wacom_IOManager
killall WacomTabletDriver
killall TabletDriver
killall WacomTouchDriver
killall Wacom\ Center

sleep 1

open -a Wacom\ Center


/opt/homebrew/bin/terminal-notifier -message "Wacom Services Restarted" -title "Wacom"



