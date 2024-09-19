#!/bin/bash

opacity=$(yabai -m config window_opacity)

if [ "$opacity" == "on" ]; then
    new_opacity="off"
else
    new_opacity="on"
fi

yabai -m config window_opacity $new_opacity


