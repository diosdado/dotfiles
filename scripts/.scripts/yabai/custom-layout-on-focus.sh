#!/bin/bash


while getopts "r" flag
do
    case $flag in
        r) reset="1";; # resets the opacity of the windows to 1
    esac
done

. ~/.scripts/.conf

windows=$(
    yabai -m query --windows | \
    jq '.[] | select( .app | contains("Inkscape"))' | \
    jq 'select( ."title" | contains(" - Inkscape")) | .id'
)

for win_id in $windows; do
    window=$(yabai -m query --windows --window $win_id)
    floating=$(echo $window | jq 'if ."is-floating" then 1 else 0 end')

    if [[ "$floating" -eq "1" ]]; then
        yabai -m window $window_id --toggle float
    fi
done





# windows=$(
#     yabai -m query --windows | \
#     jq '.[] | select( .app | contains("GIMP"))' | \
#     jq 'select((."title" | contains(" - GIMP")) or (."title" | contains("GNU Image"))) | .id'
# )

# for win_id in $windows; do
#     window=$(yabai -m query --windows --window $win_id)
#     floating=$(echo $window | jq 'if ."is-floating" then 1 else 0 end')

#     if [[ "$floating" -eq "1" ]]; then
#         yabai -m window $window_id --toggle float
#     fi
# done


