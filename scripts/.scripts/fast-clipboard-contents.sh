#!/bin/bash

dir=~/clipboard/
file=${dir}.cb.txt
space=''

touch $file
echo $space > $file

echo -e "[ HYPER ´ ]" >> $file
cat ${dir}cp_backtick.txt >> $file

echo -e $space >> $file

echo -e "[ HYPER + ]" >> $file
cat ${dir}cp_plus.txt >> $file

echo -e $space >> $file

echo -e "[ HYPER { ]" >> $file
cat ${dir}cp_curly_open.txt >> $file

echo -e $space >> $file

echo -e "[ HYPER } ]" >> $file
cat ${dir}cp_curly_close.txt >> $file

echo -e $space >> $file

echo -e "[ MEH - ]" >> $file
cat ${dir}cp_hyphen.txt >> $file

echo -e $space >> $file

echo -e "[ MEH . ]" >> $file
cat ${dir}cp_period.txt >> $file

echo -e $space >> $file

echo -e "[ MEH , ]" >> $file
cat ${dir}cp_comma.txt >> $file


OIFS="$IFS" ; IFS=$'\n'
osascript -e "tell app \"System Events\" to display alert \"Fast Clipboard\" message \"$(cat $file)\""
IFS="$OIFS"




