#!/bin/bash


while getopts f: flag
do
    case "${flag}" in
        f) filename=${OPTARG};;
    esac
done

delimiter="\n-------------------------------------\n"

touch $filename

echo "" > $filename

echo -e "[ hyper ´ ]\n" >> $filename
cat ~/clipboard/cp_backtick.txt >> $filename
echo -e $delimiter >> $filename

echo -e "[ hyper + ]\n" >> $filename
cat ~/clipboard/cp_plus.txt >> $filename
echo -e $delimiter >> $filename

echo -e "[ hyper { ]\n" >> $filename
cat ~/clipboard/cp_curly_open.txt >> $filename
echo -e $delimiter >> $filename

echo -e "[ hyper } ]\n" >> $filename
cat ~/clipboard/cp_curly_close.txt >> $filename
echo -e $delimiter >> $filename

echo -e "[ meh - ]\n" >> $filename
cat ~/clipboard/cp_hyphen.txt >> $filename
echo -e $delimiter >> $filename

echo -e "[ meh . ]\n" >> $filename
cat ~/clipboard/cp_period.txt >> $filename
echo -e $delimiter >> $filename

echo -e "[ meh , ]\n" >> $filename
cat ~/clipboard/cp_comma.txt >> $filename


