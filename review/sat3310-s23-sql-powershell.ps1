# sat3310 - lab09
# created by toarney@mtu.edu
# 4/5/22

# Variables
# OLD $dataSource =
"np:\\.\pipe\LOCALDB#6A08D565\tsql\quer
y";
$datasource = "(localdb)\sat3310"
#$user = "user"
#$pwd = "1234"
$database = "sat3310"
#$connectionString =
"Server=$dataSource;uid=$user;
pwd=$pwd;Database=$database;Integrated
Security=False;"

# Variables
# NEW
$mySqlServer =
"(localdb)\sat3310"
$myDatabase = "Wireless"
$myTable = "wireless"

# SQL Command
# Select everything
#$query = "SELECT * FROM
wireless"
$query = "SELECT manuf, COUNT(*)
FROM wireless GROUP BY manuf
ORDER BY COUNT(*)"

# SQL Connection setup
# OLD Method
$connection = New-Object
System.Data.SqlClient.SqlConnection
$connection.ConnectionString =
$connectionString
$connection.Open()
$command = $connection.CreateCommand
()
$command.CommandText = $query

# OLD method
$result = $command.ExecuteReader
()

• NEW method
• For example in PowerShell
Invoke-Sqlcmd -ServerInstance
"(localdb)\sat3310" -Database "sat3310" -Query
"SELECT * FROM wireless WHERE Manuf='Apple';"
• For PowerShell script:
$results = Invoke-Sqlcmd -ServerInstance
"mySqlServer" -Database "myDatabase" -Query
"SELECT * FROM MyTable"

• NEW method
• Invoke-Sqlcmd
• If you get the error:
'Invoke-Sqlcmd' is not recognized as the name of
a cmdlet
Install-Module sqlserver

# Table
# OLD Method – do not use
$table = new-object
"System.Data.DataTable"
$table.Load($result)

# Results
# NEW method
Write-Output $results