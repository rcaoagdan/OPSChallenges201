# Script Name : Challenge 9
# Author : Raymond Caoagdan
# Date of Last Revision : 03 / 07 / 2021
# Purpose : Power shell script that outputs Events into determined files. Print screen evenrts with certain IDs



Get-EventLog System -after (Get-Date).AddDays(-1) | Out-File -FilePath .\last_24.txt #Prints Sytem events of last 24hours to last_24.txt 

Get-EventLog System -EntryType Error  | Out-File -FilePath .\error.txt #Prints out all Errors on system event logs to error.txt

