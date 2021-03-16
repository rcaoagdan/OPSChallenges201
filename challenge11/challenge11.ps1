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
}
function fileandprint {
    Write-Output "Here are the current File and Printer Sharing settings"
    Write-Output $printrule
    $fileprintinput = Read-Host Shall we enable y/n?
    if ($fileprintinput -eq "y") {
        Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
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