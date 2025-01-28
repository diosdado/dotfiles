#!/bin/ksh



files=$(find $1/ -mindepth 1 -maxdepth 1 -type f -name "*.htm")

# echo $files

for item in $files  ; do

    item_name=$(basename "$item")
    echo "file: ${item_name} "

done







