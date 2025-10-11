#!/bin/bash

# converts all the folders with jpg images to pdfs
# requires imagemagik


OIFS="$IFS"
IFS=$'\n'

folders=$(find $1/ -mindepth 1 -maxdepth 1 -type d)

for folder in $folders  ; do

    folder_name=$(basename "$folder")
    echo "Converting ${folder_name} to pdf..."
    magick "${1}/${folder_name}/*.jpg" -auto-orient "${1}/${folder_name}.pdf"

done

IFS="$OIFS"

