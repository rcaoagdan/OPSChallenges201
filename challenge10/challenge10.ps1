#Script Name : Challenge 10
#Autor: Raymond Caoagdan
#Date of last revision : 03/11/2021
#Purpose : System Process Powershell commands 

#Variables
#$CPUTIME = Get-Process | Sort-Object -Property CPU -Descending| Format-Table -Property * -AutoSize #Variable for Highest CPU TIME
#$CPUID = Get-Process | Sort-Object -Property Id -Descending | Format-Table -Property * -AutoSize #Variable with Highest ID first
#$top5 = Get-Process | Sort-Object -Property WorkingSet -Descending |Select -First 5| Format-Table -Property * -AutoSize # variable for highest working set 
$url = "https://owasp.org/www-project-top-ten/" #variable set to url link
$range = 1..13 # variable used range so that result is 10

#Functions
function timecpu {
    #Write-Output $CPUTIME
    Get-Process | Sort-Object -Property CPU -Descending| Format-Table -Property * -AutoSize #Variable for Highest CPU TIME
	mainone
}

function idcpu {
    #Write-Output $CPUID
    Get-Process | Sort-Object -Property Id -Descending | Format-Table -Property * -AutoSize #Variable with Highest ID first
   mainone
}

function 5top {
    #Write-Output $top5
    Get-Process | Sort-Object -Property WorkingSet -Descending |Select -First 5| Format-Table -Property * -AutoSize # variable for highest working set 
   mainone
}

function opensweb {
    foreach($i in $range){
        Start-Process iexplore.exe $url
     }
     $inputweb = Read-Host "Would you Like to close all windows y/n?"
     if($inputweb -eq "y"){
        taskkill /IM iexplore.exe /F 
     }
     elseif ($inputweb -eq "n") {
         Write-Output "Suit yourself"
     }
	mainone
}

function killprocess {
    Get-Process | Format-Table -Property * -AutoSize #print processes in Alphabetical order
    $killcommand = Read-Host "What Command would you like to kill?"
    Stop-Process -Id $killcommand -Confirm -PassThru #stop process by confirming you want to
	mainone
}
function mainone {
    Write-Output "Hello, Please look below"
    Write-Output "1. List Active Process with Highest CPU Time "
    Write-Output "2. List Active Process with Highest ID"
    Write-Output "3. List Top 5 Active Process Working Set "
    Write-Output "4. Open OWSAP Top Ten "
    Write-Output "5. Kill a process"
    $inputentry = Read-Host What would you like to do?...
	if($inputentry -eq 1){
    timecpu
    }elseif($inputentry -eq 2){
    idcpu
    }elseif($inputentry -eq 3){
    5top
    }elseif($inputentry -eq 4){
    opensweb
    }elseif($inputentry -eq 5){
    killprocess
    }	
}

#main
mainone
#end
