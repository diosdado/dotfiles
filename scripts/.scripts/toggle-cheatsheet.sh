#!/bin/bash

if ps aux | grep qlmanage | grep -v grep; then
    killall qlmanage
    exit 0
fi

qlmanage -p $1
