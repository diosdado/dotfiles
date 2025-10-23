#!/bin/bash

. ~/.scripts/.conf

case $focus_follows_mouse in
    yes)
        /opt/homebrew/bin/yabai -m config focus_follows_mouse autoraise
        /opt/homebrew/bin/yabai -m config mouse_follows_focus on
        ;;

    no)
        /opt/homebrew/bin/yabai -m config focus_follows_mouse off
        /opt/homebrew/bin/yabai -m config mouse_follows_focus off
        ;;
esac

