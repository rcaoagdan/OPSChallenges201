#Script Name : Challenge 11
#Autor: Raymond Caoagdan
#Date of last revision : 03/13/2021
#Purpose : Automated Endpoint configurations
# Automate system configurations on Windows 10

#variables

$printrule = Get-NetFirewallRule -DisplayGroup 'File and Printer Sharing'
$viewremoterules = Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server'
$viewbloat = DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename
$smbv1set = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol 

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
        Write-Output "Please make a correct selection"
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
    Write-Output "ICMP Traffice left Alone"
    mainfunction
    }
    else {
    Write-Output "Please make a correct selection"
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
    $askbloat = Read-Host Shall We remove some bloatware y/n? 
    if ($askbloat -eq "y") {
         Write-Output $viewbloat
         $bloatremove =Read-Host Enter what you want to remove:
         DISM /Online /Remove-ProvisionedAppxPackage /PackageName:$bloatremove
    }
    elseif ($askbloat -eq "n") {
        Write-Output "Nothing is to be removed"
        mainfunction
    }
    else {
        Write-Output "Please make a correct selecion"
    }

}

function hypev {
   $hyperVM = Read-Host Shall we enable Hyper-V y/n?
   if ($hyperVM -eq "y") {
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
    mainfunction
   }
   elseif ($hyperVM -eq "no") {
       Write-Output "Hyper V left alone "
       mainfunction
   }
   else {
       Write-Output "Please make a correct selection"
       hypev
   }
    
}
function disSMBvv1 {
    Write-Output "Here is the current settings"
    Write-Output $smbv1set
    $disableinsecure = Read-Host Shall we disable SMBv1 y/n?
    if ($disableinsecure -eq "y") {
        Disable-WindowsOptionalFeature -Online -FeatureName smb1protocol
        mainfunction
    }
    elseif ($disableinsecure -eq "y") {
        confirmdiss  
        }
    else {
        Write-Output "Please make a correct selection"
    }

    }  

function confirmdiss {
    Write-Output "SMBv1 is insecure"
    $confirm = Read-Host Are you sure you leave it alone y/n?
    if ($confirm -eq "y") {
        Write-Output "SMBv1 Left alone"
        mainfunction
    }
    elseif ($confirm -eq "n") {
        #Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
        Disable-WindowsOptionalFeature -Online -FeatureName smb1protocol
        mainfunction
    }
    else {
        Write-Output "Please make a correct selection"
        confirmdiss
    }
        
}

#main
mainfunction
#end

#google docs https://docs.google.com/document/d/133BV_arIONw-FU8AT1vlN5T3mLW2YR1qF0owlwKCrs8/edit?usp=sharing