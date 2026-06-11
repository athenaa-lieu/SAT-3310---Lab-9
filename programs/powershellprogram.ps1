7 SQL Setup - PowerShell
Your will need two software packages:
The SQL Express database engine
The SQL Express management tools
You will also need the actual data files that are in comma separated value (CSV) format
export.csv.zip
which contains
wireless.csv
clients.csv

7.1 The SQL Express database engine
Download SQL Express LocalDB
http://www.microsoft.com/en-us/download/details.aspx?id=42299
Make sure to choose:
LocalDB 64BIT\SqlLocalDB.msi
or
http://pages.mtu.edu/~toarney/sat3310/lab14/SqlLocalDB.msi

7.1.1 Install the SQL Express LocalDB
Note: you may need to reboot

7.1.2 Start the SQL Express Engine
https://www.mssqltips.com/sqlservertip/2694/getting-started-
with-sql-server-2012-express-localdb/
From a command prompt:
CMD
sqllocaldb create “sat3310”
sqllocaldb start “sat3310”
sqllocaldb info “sat3310”

7.2 The SQL Express management tools
Download SQL Server Management Studio (SSMS)
Note: This can take a long time
https://msdn.microsoft.com/en-us/library/mt238290.aspx

7.2.1 Install the SSMS
Note: This can take a long time
Note: You may need to reboot

7.3 SQL Database
http://pages.mtu.edu/~toarney/sat3310/lab14/export.csv.zip
Unzip the file and place the files:
wireless.csv
clients.csv
into
C:\Users\sat3310\Documents\lab09\data
Note: If you want to use MySQL, the file is available at:
http://pages.mtu.edu/~toarney/sat3310/lab11/wirelessmysql.sql

7.3.1 Import the SQL Data
NOTE: These instructions may be outdated. If you are using the new Microsoft SQL Server
Management Studio, use these instructions:

7.3.1.1 Launch SSMS:

7.3.1.2 Connecting to the Database
Use the database you created in 7.1.2:
(localdb)\sat3310

7.3.1.3 Create a new database
On Database, right-click, New Database
Name it "Wireless", Then click Ok to create the database

7.3.1.4 Import the data
Right click on the new Wireless database, Tasks, Import Flat File…
Select the "wireless.csv" file you downloaded
Note: You will need to uncheck the “Use Rich Data Type Detection” during import:
The rest are defaults.

7.3.1.5 Import data - again
Repeat for the "clients.csv" data:
Right click on the new Wireless database, Tasks, Import Flat File…
Note: You will again need to uncheck the “Use Rich Data Type Detection” during import:

7.4 Test the SQLCMD utility

7.4.1 You will need to make sure that the SQLCMD utility is working.
Open a command prompt. Note: this is different than a PowerShell prompt.
Right-click on Start - Run… cmd
In the CMD prompt, type:
sqlcmd -?
and you should see the following output:
If this works - skip ahead to Section 8.
If you cannot run the sqlcmd, you will need to install sqlcmd from:
https://go.microsoft.com/fwlink/?linkid=2082790
Restart your computer after installing sqlCMD

8 SQL Testing - PowerShell

8.1 Connect to the database
Note: normally you can use
Start - Run - CMD
sqlcmd –S (localdb)\sat3310
Hopefully this works and you get an SQL command prompt "1>"
If this works, skip ahead to section 8.4.
Otherwise, continue on.
Due to a bug you will need to use the “named pipe”. See:
https://technet.microsoft.com/en-us/library/ms165702(v=sql.105).aspx

8.2 To find the named pipe:
CMD
sqllocaldb info "sat3310"
Look for the "Instance named pipe"
C:\Users\Admin>sqllocaldb info "sat3310"
Name: sat3310
Version: 12.0.2000.8
Shared name:
Owner: test-PC\Admin
Auto-create: No
State: Running
Last start time: 6/9/2016 11:23:48 AM
Instance pipe name: np:\\.\pipe\LOCALDB#6A08D565\tsql\query

8.3 Now connect to the named pipe:
CMD
C:\Users\Admin>sqlcmd -S np:\\.\pipe\LOCALDB#6a08D565\tsql\query
You should get the SQL prompt: 1>
Note: if you do not get the the SQL prompt with an error similar to:
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server: SQL
Server Network Interfaces: The parameter is incorrect.
You will need to install the ODBC driver:
Start > Control Panel > Uninstall a program.
Select Microsoft ODBC Driver 13 for SQL Server and press Change.
Choose the Modify radio option and click Next.
The ODBC Driver for SQL Server SDK needs to be selected "Will be installed on local hard drive."
Click Next > Install > Finish.
Now try connecting again from the CMD prompt:
C:\Users\Admin>sqlcmd -S np:\\.\pipe\LOCALDB#6a08D565\tsql\query
You should get the SQL prompt: 1>

8.4 Query the database:

8.4.1 Select the database
use Wireless;
go

8.4.2 Select everything from the table wireless
select * from wireless;
go
Note: you can use “Ctrl+C” to stop the output

8.4.3 Select the database
use Wireless;
go

8.4.4 Select everything from the table clients
SELECT * FROM clients;
go

8.4.5 Select only the Apple wireless clients
SELECT * FROM clients WHERE manuf=’Apple’;
go

8.4.6 Count the Apple wireless clients
SELECT COUNT(*) FROM clients WHERE manuf="Apple";
go

8.4.7 Select the manufacturer and counts of clients, then group by the manufacturer, and sort
by the count:
SELECT manuf, COUNT(*) FROM clients GROUP BY manuf ORDER BY
COUNT(*);
go

8.4.8 SS Take a screenshot of the results of the SQL above command

9 Installing the SQL Module - Powershell

9.1 SQL Module
In order to use SQL in powershell we need to install the SQLServer module to use some
commands in our script, go to a PowerShell prompt - Run as Administrator:
and type in:
Install-Module SQLServer -Scope CurrentUser
While
installing make sure to agree to all terms provided.