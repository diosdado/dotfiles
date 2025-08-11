#!/usr/bin/env bash

OIFS="$IFS"
IFS=$'\n'


# assigns labels to the spaces based on the position of the displays that contain them

spaces_names=(
    # macbook
    s_secondary
    s_messages
    s_email
    s_entertainment
    # yodoit
    s_third
    s_preview
    s_conference
    s_reminders
    # LG
    s_primary
    s_design
    s_browser
    s_development
)

spaces_numbers=($(/opt/homebrew/bin/yabai -m query --displays | jq 'sort_by(.index)|.[].spaces.[]'))

for i in "${!spaces_names[@]}"; do
    command="/opt/homebrew/bin/yabai -m space ${spaces_numbers[$i]} --label ${spaces_names[$i]}"
    eval "$command"
done



IFS="$OIFS"


