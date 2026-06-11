# SAT 3310 - Lab 9
# Created by Athena Lieu (xlieu@mtu.edu)
# Date: June 11th, 2026
# Comments: This lab demonstrates how to connect to a SQL database using PowerShell,
# execute a query, and display the results.
# It assumes that you have already set up the SQL Express LocalDB
# and imported the necessary data into a database named "Wireless".

# Variables

$serverName = "(localdb)\MSSQLLocalDB"
$databaseName = "Wireless"

# SQL Commands

$query = "SELECT manuf, COUNT(*) FROM wireless GROUP BY manuf ORDER BY COUNT(*)"

# SQL Connection Setup

# Connect to the database and execute the query
$connectionString = "Server=$serverName;Database=$databaseName;Integrated Security=True;"

$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
$connection.Open()

# Table

# Create a SQL command object
$command = $connection.CreateCommand()
$command.CommandText = $query

# Execute the command and read the results

$adapter = New-Object System.Data.SqlClient.SqlDataAdapter $command
$dataSet = New-Object System.Data.DataSet
$adapter.Fill($dataSet)

# Results

# Display the results
$results = $dataSet.Tables[0]

# Output the results to the console
Write-Output $results

# Close SQL Connection

$connection.Close()