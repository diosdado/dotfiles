#!/bin/bash

while getopts "n:" flag; do
    case $flag in
        n) name=${OPTARG};;
    esac
done

contents=$(cat "/Users/david.diosdado/clipboard/cp_$name.txt" | /usr/bin/tr -d '\n')
echo "$contents" | /usr/bin/pbcopy


