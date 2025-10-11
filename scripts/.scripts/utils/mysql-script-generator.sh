#!/bin/bash

OIFS="$IFS"
IFS=$'\n'

tables=(
)


action=$1

# mysqlpath=""
mysqlpath="/usr/local/mysql/bin/"
# mysqlpath="c:\wamp\\bin\mysql\mysql5.6.12\\bin\\"

password=""

if [[ -n $2 ]]; then
    password="-p$2"
fi

filename=~/mysql_script.ksh
database="sistema_nuevo"

touch $filename

echo '' > $filename

for table in "${tables[@]}"; do

    case $action in
    1) # create imports to new databases
        echo "echo \"importando db $table...\"" >> $filename
        echo "${mysqlpath}mysql -u root $password -e 'create database ${table};'" >> $filename
        echo "${mysqlpath}mysql -u root $password ${table} < ${table}.sql" >> $filename
        echo "echo \"completada importacion de db $table.\"" >> $filename
        echo "echo ----" >> $filename
        ;;
    5) # create imports of tables into database
        echo "echo \"importando tabla $table en $database...\"" >> $filename
        echo "${mysqlpath}mysql -u root $password $database < ${table}.sql" >> $filename
        echo "echo \"completada importación de tabla $table en $database.\"" >> $filename
        echo "echo ----" >> $filename
        ;;
    2) # create dumps
        echo "echo \"  exportando $table...\"" >> $filename
        echo "${mysqlpath}mysqldump -ubackup --opt $table > ${mysqlpath}${table}.sql" >> $filename
        echo "echo \"  completada $table\"" >> $filename
        echo "echo ----" >> $filename
        ;;
    3) # remove corrupted ibds
        echo "rm $table.ibd" >> $filename
        ;;
    4) # create databases
        echo "${mysqlpath}mysql -u root $password -e 'create database $table'" >> $filename
        ;;
    esac


done

cat $filename


IFS="$OIFS"

