3 SQL general setup - BASH
For this lab we will be using SQLite in Linux:
https://www.sqlite.org/
SQLite is a software library that implements a self-contained, serverless, zero-configuration,
transactional SQL database engine. SQLite is the most widely deployed database engine in the
world.

3.1 SQL setup
Download the sqlite database at:
https://pages.mtu.edu/~toarney/sat3310/lab11/wireless.dbl
and put the file in
~/Documents/labs/lab09/data
Note: If you want to use MySQL, the file is available at:
http://pages.mtu.edu/~toarney/sat3310/lab11/wirelessmysql.sql

3.2 SQL General
To start using the SQL database:
$ sqlite3 wireless.dbl
Try running some of these commands for practice:
Get help
sqlite> .help
Get info on the database file
sqlite> .databases
Show all available tables:
sqlite> .tables
Show the schema on clients
sqlite> .schema clients
Select everything from clients
sqlite> SELECT * FROM clients;
Select only the Apple wireless clients
sqlite> SELECT * FROM clients WHERE manuf=’Apple’;
Count the Apple wireless clients
sqlite> SELECT COUNT(*) FROM clients WHERE manuf=’Apple’;
Select the manufacturer and counts of clients, then group by the manufacturer, and sort by the
count:
sqlite> SELECT manuf, COUNT(*) FROM clients GROUP BY manuf ORDER
BY COUNT(*);

3.3 Q What is the average altitude of Apple Access Point devices? 216.063690238095
Note: The data for access points is in the "wireless" table, not the "clients" table.