#!/bin/bash


filename=~/.cb.txt
delimiter=""

touch $filename

echo "" > $filename
echo -e "[ HYPER ´ ]" >> $filename
cat ~/clipboard/cp_backtick.txt >> $filename
echo -e $delimiter >> $filename
echo -e "[ HYPER + ]" >> $filename
cat ~/clipboard/cp_plus.txt >> $filename
echo -e $delimiter >> $filename
echo -e "[ HYPER { ]" >> $filename
cat ~/clipboard/cp_curly_open.txt >> $filename
echo -e $delimiter >> $filename
echo -e "[ HYPER } ]" >> $filename
cat ~/clipboard/cp_curly_close.txt >> $filename
echo -e $delimiter >> $filename
echo -e "[ MEH - ]" >> $filename
cat ~/clipboard/cp_hyphen.txt >> $filename
echo -e $delimiter >> $filename
echo -e "[ MEH . ]" >> $filename
cat ~/clipboard/cp_period.txt >> $filename
echo -e $delimiter >> $filename
echo -e "[ MEH , ]" >> $filename
cat ~/clipboard/cp_comma.txt >> $filename


OIFS="$IFS" ; IFS=$'\n'
osascript -e "tell app \"System Events\" to display alert \"Fast Clipboard\" message \"$(cat ~/.cb.txt)\""
IFS="$OIFS"




