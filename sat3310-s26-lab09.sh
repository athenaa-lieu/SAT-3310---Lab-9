# vi ~/Documents/labs/SAT-3310---Lab-9/sat3310-s26-lab09.sh

#!/usr/bin/bash

# SAT 3310 - Lab 9
# Created by Athena Lieu (xlieu@mtu.edu)
# Date: June 11th, 2026
# Comments: This script executes an SQL query on the wireless database to calculate the average GPS altitude
# and count of Apple wireless clients.
# The results are printed in a readable format.

# Variables

sqliteprog="/usr/bin/sqlite3"

databasepath="$HOME/Documents/labs/SAT-3310---Lab-9/data/"
databasefile="wireless.dbl"

# SQL Statement

sqlstatement="SELECT manuf, AVG(GPSBestAlt), COUNT(*) FROM wireless WHERE manuf='Apple';"

# Main

# Execute the SQL statement and store the results in a variable
list=`$sqliteprog $databasepath$databasefile "$sqlstatement"`

# Process the output of the SQL query

# The output will be in the format: "Manufacturer|Average Altitude|Count"
# We will split the output by the '|' delimiter and print the results in a readable format.
# Note: The output may contain multiple lines if there are multiple manufacturers, but in this case, we expect only one line for Apple.
# Example output: "Apple|216.063690238095|10"
for line in $list
do
    manuf=$(echo -e $line | /usr/bin/cut -d '|' -f 1)
    altitude=$(echo -e $line | /usr/bin/cut -d '|' -f 2)
    count=$(echo -e $line | /usr/bin/cut -d '|' -f 3)

    echo "Manufacturer: $manuf, Average Altitude: $altitude, Count: $count"
done