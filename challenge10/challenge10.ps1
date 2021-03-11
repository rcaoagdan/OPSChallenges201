#Script Name : Challenge 10
#Autor: Raymond Caoagdan
#Date of last revision : 03/10/2021
#Purpose : System Process Powershell commands 

#Variables
$CPUTIME = Get-Process | Sort-Object -Property CPU -Descending| Format-Table -Property * -AutoSize #Variable for Highest CPU TIME
$CPUID = Get-Process | Sort-Object -Property Id -Descending | Format-Table -Property * -AutoSize #Variable with Highest ID first
$top5 = Get-Process | Sort-Object -Property WorkingSet -Descending |Select -First 5| Format-Table -Property * -AutoSize # variable for highest working set 
$url = "https://owasp.org/www-project-top-ten/" #variable set to url link
$range = 1..13 # variable used range so that result is 10

#functions 
function inputselection {
    Write-Output "Hello, Please look below"
    Write-Output "1. List Active Process with Highest CPU Time "
    Write-Output "2. List Active Process with Highest ID"
    Write-Output "3. List Top 5 Active Process Working Set "
    Write-Output "4. Open OWSAP Top Ten "
    Write-Output "5. Exit"
    $inputentry = Read-Host What would you like to do?...
}

function timecpu {
    Write-Output $CPUTIME
}

function idcpu {
    Write-Output $CPUID
}

function 5top {
    Write-Output $top5
}

function opensweb {
    Start-Process iexplore.exe $url
}

#main
#foreach($url in $range){
 #   Start-Process iexplore.exe
#}
inputselection

if($inputentry -eq 1){
    timecpu
}elseif($inputentry -eq 2){
    idcpu
}elseif($inputentry -eq 3){
    5top
}elseif($inputentry -eq 4){
    opensweb
}elseif($inputentry -eq 5){
    Remove-PSSession
}else{
    echo "No Correct Selection Made,  "
}
#end