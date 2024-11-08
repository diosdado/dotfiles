window=$(echo $(yabai -m query --windows) | jq '.[] | select(."has-focus" == true)')
window_reminders=$(echo $(yabai -m query --windows) | jq '.[] | select(."title" == "Reminders")')

# yabai -m query --windows | jq '.[] | select(."app" == "Stickies" or ."app" == "Vivaldi") | .id'

window_id=$(echo $window | jq '.id')
window_reminders_id=$(echo $window_reminders | jq '.id')

if [[ $window_id -eq $window_reminders_id ]]; then
    yabai -m window "$window_reminders_id" --opacity 0.0
else
    yabai -m window "$window_reminders_id" --opacity 0.4
fi

