#!/usr/bin/bash
# sat3310 - labXX
# created by toarney@mtu.edu
# 6/7/2016

# Variables
databasepath="/dump/sat3310/lab11/"
databasefile="wireless.dbl"
sqlprog="/usr/bin/sqlite3"

# SQL Statement
sqlstatement="SELECT manuf,
AVG(GPSBestAlt), COUNT(*) FROM
wireless GROUP BY manuf ORDER BY
AVG(GPSBestAlt);"

# Main
$sqlprog $databasepath$databasefile
"$sqlstatement"
list=`$sqlprog
$databasepath$databasefile
"$sqlstatement"`

for line in $list
do
# echo $line
# echo -e $line | /usr/bin/cut -d '|' -f 1
# echo -e $line | /usr/bin/cut -d '|' -f 2
# echo -e $line | /usr/bin/cut -d '|' -f 3
done

manuf=$(echo -e $line |
/usr/bin/cut -d '|' -f 1)
altitude=$(echo -e $line |
/usr/bin/cut -d '|' -f 2)
count=$(echo -e $line |
/usr/bin/cut -d '|' -f 3)

echo $manuf, $altitude, $count

done