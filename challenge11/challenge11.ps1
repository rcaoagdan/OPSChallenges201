#Script Name : Challenge 11
#Autor: Raymond Caoagdan
#Date of last revision : 03/13/2021
#Purpose : Automated Endpoint configurations
# Automate system configurations on Windows 10

#variables

$printrule = Get-NetFirewallRule -DisplayGroup 'File and Printer Sharing'
$viewremoterules = Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server'
$viewbloat = DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename

#fuctions
function mainfunction {
    Write-Output "Hello, welcome to self automation"
    Write-Output "1. Enable File and Printer Sharing"
    Write-Output "2. Allow ICMP traffic"
    Write-Output "3. Enable Remote management"
    Write-Output "4. Remove bloatware"
    Write-Output "5. Enable hyper-v"
    Write-Output "6. Disable SMBv1"
    Write-Output "7.Exit"
    $maininput = Read-Host What would you like to do? 
   
        if($maininput -eq 1){
            fileandprint
        }
        elseif ($maininput -eq 2) {
            allowicmptraffic
        }
        elseif ($maininput -eq 3) {
            remotemanage
        }
        elseif ($maininput -eq 4) {
            bloatwarermv
        }
        elseif ($maininput -eq 5) {
            hypev
        }
        elseif ($maininput -eq 6) {
            disSMBvv1
        }
        elseif ($maininput -eq 7) {
            exit
        }
        else {
           Write-Output "Incorrect Selection"
           mainfunction
        }
            
        
    }
    

function fileandprint {
    Write-Output "Here are the current File and Printer Sharing settings"
    Write-Output $printrule
    $fileprintinput = Read-Host Shall we enable y/n?
    if ($fileprintinput -eq "y") {
        Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
        mainfunction
    }
    elseif ($fileprintinput -eq "n") {
        Write-Output "File and Printer Sharing shall be left alone"
        mainfunction
    }
    else {
        Write-Output "PLease enter correct entry"
        fileandprint
    }
}
function allowicmptraffic {
   $traffic = Read-Host Shall we enable ICMP traffic y/n?
   if ($traffic -eq "y") {
    netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4
    mainfunction
    }
    elseif ($traffic -eq "n") {
    Write-Output "File and Printer Sharing shall be left alone"
    mainfunction
    }
    else {
    Write-Output "PLease enter correct entry"
    allowicmptraffic
    }
}

function remotemanage {
    $remote = Read-Host Shall we enable remote management y/n?
    if ($remote -eq "y") {
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
        mainfunction
    }
    elseif ($remote -eq "n") {
        Write-Output "Remote Management Left Alone"
        mainfunction
    }
    else {
        Write-Output "Please make a correct selection"
        remotemanage
    }
}
function bloatwarermv {
    Write-Output "Hello Please look at the current bloatware"
    Write-Output $viewbloat
    $bloatremove =Read-Host Enter what you want to remove:
    DISM /Online /Remove-ProvisionedAppxPackage /PackageName:$bloatware

}

# Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True #Turn on File and Printer Sharing
 #Get-NetFirewallRule -DisplayGroup 'File and Printer Sharing' #view status of file and printer sharing

 # netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4 #Allow ICMP traffic

 # reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f #remtoe management
 # Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' #view remote management


 # iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat')) #remove bloateware
 # Get-AppxPackage -name " " | Remove-AppxPackage #removebloatware
# DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename #view bloatware run as adminstrator
# DISM /Online /Remove-ProvisionedAppxPackage /PackageName:PACKAGENAME #remove bloatware

 # Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All #enable hyper v
 # DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V #DISM hyper v 
# Get-Command -Module hyper-v | Out-GridView # list hyperv commands

 # Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force #smb1 disabled
mainfunction