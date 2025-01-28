#!/bin/bash

dir=~/clipboard/
file=${dir}.cb.txt
space=''

touch $file
echo $space > $file

echo -e "[ y ]" >> $file
cat ${dir}cp_y.txt >> $file
echo -e $space >> $file

echo -e "[ u ]" >> $file
cat ${dir}cp_u.txt >> $file
echo -e $space >> $file

echo -e "[ i ]" >> $file
cat ${dir}cp_i.txt >> $file
echo -e $space >> $file

echo -e "[ o ]" >> $file
cat ${dir}cp_o.txt >> $file
echo -e $space >> $file

echo -e "[ p ]" >> $file
cat ${dir}cp_p.txt >> $file
echo -e $space >> $file

echo -e "[ h ]" >> $file
cat ${dir}cp_h.txt >> $file
echo -e $space >> $file

echo -e "[ j ]" >> $file
cat ${dir}cp_j.txt >> $file
echo -e $space >> $file

echo -e "[ k ]" >> $file
cat ${dir}cp_k.txt >> $file
echo -e $space >> $file

echo -e "[ l ]" >> $file
cat ${dir}cp_l.txt >> $file
echo -e $space >> $file


OIFS="$IFS" ; IFS=$'\n'
osascript -e "tell app \"System Events\" to display alert \"Fast Clipboard\" message \"$(cat $file)\""
IFS="$OIFS"




