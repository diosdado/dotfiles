#!/bin/bash


if ps aux | grep 'Sandox Meet' | grep -v grep; then
    open ~/Applications/Sandox\ Meet.app
    exit 0
fi


if ps aux | grep 'Microsoft Teams' | grep -v grep; then
    open ~/Applications/Microsoft\ Teams.app
    exit 0
fi






