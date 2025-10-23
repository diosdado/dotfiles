#!/bin/bash


while getopts "l:" flag; do
    case $flag in
        l) layer=${OPTARG};;
    esac
done

. ~/.scripts/.conf

case $layer in
    none)
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"yabai_layer":0}'
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"app_layer":0}'
        /opt/homebrew/bin/borders active_color=$border_inactive
        ;;

    default)
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"yabai_layer":0}'
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"app_layer":0}'
        /opt/homebrew/bin/borders active_color=$border_active
        ;;

    shift)
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"yabai_layer":0}'
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"app_layer":0}'
        /opt/homebrew/bin/borders active_color=$border_shift
        ;;

    yabai)
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"yabai_layer":1}'
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"app_layer":0}'
        /opt/homebrew/bin/borders active_color=$border_yabai
        ;;

    apps)
        # '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"yabai_layer":0}'
        # '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"app_layer":1}'
        /opt/homebrew/bin/borders active_color=$border_apps
        ;;
esac



