#!/bin/bash

filename=~/clipboard/.fastclipboard.txt
delimiter="\n----------------------\n"

touch $filename

echo "" > $filename

echo -e "ctrl ´\n" >> $filename
cat ~/clipboard/cp_backtick.txt >> $filename
echo -e $delimiter >> $filename

echo -e "ctrl +\n" >> $filename
cat ~/clipboard/cp_plus.txt >> $filename
echo -e $delimiter >> $filename

echo -e "ctrl {\n" >> $filename
cat ~/clipboard/cp_curly_open.txt >> $filename
echo -e $delimiter >> $filename

echo -e "ctrl }\n" >> $filename
cat ~/clipboard/cp_curly_close.txt >> $filename
echo -e $delimiter >> $filename

echo -e "ctrl ,\n" >> $filename
cat ~/clipboard/cp_colon.txt >> $filename
echo -e $delimiter >> $filename

echo -e "ctrl .\n" >> $filename
cat ~/clipboard/cp_period.txt >> $filename
echo -e $delimiter >> $filename

echo -e "ctrl -\n" >> $filename
cat ~/clipboard/cp_hyphen.txt >> $filename

qlmanage -p $filename

echo "" > $filename
