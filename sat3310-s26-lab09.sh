# vi ~/Documents/labs/SAT-3310---Lab-9/sat3310-s26-lab09.sh

#!/usr/bin/bash

# SAT 3310 - Lab 9
# Created by Athena Lieu (xlieu@mtu.edu)
# Date: June 11th, 2026
# Comments:

# Variables

sqliteprog="/usr/bin/sqlite3"

databasepath="$HOME/Documents/labs/SAT-3310---Lab-9/data/"
databasefile="wireless.dbl"

# SQL Statement

sqlstatement="SELECT manuf, AVG(GPSBestAlt) FROM wireless WHERE manuf='Apple';"

# Main

list=`$sqliteprog $databasepath$databasefile "$sqlstatement"`

# Process the output of the SQL query

for line in $list
do
    manuf=$(echo -e $line | /usr/bin/cut -d '|' -f 1)
    altitude=$(echo -e $line | /usr/bin/cut -d '|' -f 2)
    count=$(echo -e $line | /usr/bin/cut -d '|' -f 3)

    echo "Manufacturer: $manuf, Average Altitude: $altitude, Count: $count"
done