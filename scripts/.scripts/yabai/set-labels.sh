#!/usr/bin/env bash

# assign labels to spaces in different displays


OIFS="$IFS"
IFS=$'\n'


# Yodoit
# 22A7F456-9B66-4C7C-9A7F-2200DE0D5547

# LG
# 2340F20F-8470-4826-96BC-99D64CF63A55

# MacBook
# 37D8832A-2D66-02CA-B9F7-8F30A301B230


# assigns labels to the spaces based on the position of the displays that contain them

spaces_names=(

    # macbook
    s_secondary
    s_messages
    s_email
    s_entertainment

    # yodoit
    s_third
    s_conference
    s_reminders
    s_etc

    # LG
    s_primary
    s_design
    s_development
    s_gaming


)

spaces_numbers=($(yabai -m query --displays | /opt/homebrew/bin/jq 'sort_by(.index)|.[].spaces.[]'))

for i in "${!spaces_names[@]}"; do
    command="yabai -m space ${spaces_numbers[$i]} --label ${spaces_names[$i]}"
    eval "$command"
done


# terminal-notifier -message "Reset Labels" -title "Yabai"




IFS="$OIFS"


