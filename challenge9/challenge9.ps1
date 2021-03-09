# Script Name : Challenge 9
# Author : Raymond Caoagdan
# Date of Last Revision : 03 / 08 / 2021
# Purpose : Power shell script that outputs Events into determined files. Print screen evenrts with certain IDs

#main

Get-EventLog System -after (Get-Date).AddDays(-1) | Out-File -FilePath .\last_24.txt #Prints Sytem events of last 24 hours to last_24.txt
# -after (Get-Date) will get info from days set on .AddDays(-string) where string is how many days out. 
#outfile used to print out info to selected path with -FilePath .\string where string is where you want the info printed too. | >> last_24.txt also works

Get-EventLog System -EntryType Error  | Out-File -FilePath .\error.txt #Prints out all Errors on system event logs to errors
# -EntryType is where you select what entry type you wish in the system log

Get-EventLog System -InstanceId 16 #-InstanceId is used to select a certain event ID you wish in this case 16

Get-EventLog System -Newest 20 # Newest used followed by parameter to print out newest entry. 

$Events = Get-EventLog System -Newest 500 #varaible set to print 500 system log entries. 
$Events | Select-Object -ExpandProperty message #select -expandproperty used to extend the message so the printed info is not shortened 

#end