#!/bin/bash


while getopts "l:" flag; do
    case $flag in
        l) layer=${OPTARG};;
    esac
done

. ~/.scripts/.conf


case $layer in
    none)
        /opt/homebrew/bin/borders active_color=$border_inactive
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"function_layer":0}'
        # '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"app_layer":0}'
        ;;

    default)
        /opt/homebrew/bin/borders active_color=$border_active
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"function_layer":0}'
        ;;

    shift)
        /opt/homebrew/bin/borders active_color=$border_shift
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"function_layer":0}'
        ;;

    function)
        /opt/homebrew/bin/borders active_color=$border_function
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"function_layer":1}'
        ;;

    apps)
        /opt/homebrew/bin/borders active_color=$border_apps
        '/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli' --set-variables '{"function_layer":0}'
        ;;
esac



