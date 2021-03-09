# Script Name : Challenge 9
# Author : Raymond Caoagdan
# Date of Last Revision : 03 / 08 / 2021
# Purpose : Power shell script that outputs Events into determined files. Print screen evenrts with certain IDs

#Variable to set to select log
Echo "Please look over the Sytem log below:"
Echo "1. Last 24:"
Echo "2. Errors"
Echo "3. Isntance ID 16"
Echo "4. Recent 20"
Echo "5. Recent 500"
Echo "Please ensure a correct selection is made" 
$logentry = Read-Host "Select the System log you wish to see"

#fuctions
function last24 {
    
    Get-EventLog System -after (Get-Date).AddDays(-1) | Out-File -FilePath .\last_24.txt #Prints Sytem events of last 24 hours to last_24.txt
    $last24 = Get-EventLog System -after (Get-Date).AddDays(-1)| Select-Object -ExpandProperty message #Select-Object -ExpandProperty message used to expand entry so log is not short
    echo $last24
    
}
function errorslog {
    
    Get-EventLog System -EntryType Error  | Out-File -FilePath .\error.txt #Prints out all Errors on system event logs to errors
    $logoferrors = Get-EventLog System -EntryType Error | Select-Object -ExpandProperty message
    echo $logoferrors
    
}
function instance16 {
    $eventid16 = Get-EventLog System -InstanceId 16| Select-Object -ExpandProperty message #-InstanceId is used to select a certain event ID you wish in this case 16
    echo $eventid16
    
}
function recententry {
   $recententries =Get-EventLog System -Newest 50| Select-Object -ExpandProperty message
   echo $recententries
}
function recententry2 {
    $recententries2 =Get-EventLog System -Newest 500 | Select-Object -ExpandProperty message
    echo $recententries2
 }
#main

    if($logentry -eq 1){
        last24
    }elseif($logentry -eq 2){
        errorslog
    }elseif($logentry -eq 3){
        instance16
    }elseif($logentry -eq 4){
        recententry
    }elseif($logentry -eq 5){
        recententry2
    }else{
        echo "No Correct Selection Made, exiting "
    }

  

#end

#it runs, I wanted to add it to a loop but couln't quite figure it out. Will try to update in the future just short on time.