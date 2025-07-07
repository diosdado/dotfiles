#!/usr/bin/env bash

OIFS="$IFS"
IFS=$'\n'


# assigns labels to the spaces based on the position of the displays that contain them

spaces_names=(
    # macbook
    s_secondary
    s_entertainment
    s_conference
    # LG
    s_primary
    s_design
    s_development
    # yodoit
    s_email
    s_office
    s_messages
)

spaces_numbers=($(yabai -m query --displays | jq 'sort_by(.index)|.[].spaces.[]'))

for i in "${!spaces_names[@]}"; do
    command="yabai -m space ${spaces_numbers[$i]} --label ${spaces_names[$i]}"
    eval "$command"
done



IFS="$OIFS"


