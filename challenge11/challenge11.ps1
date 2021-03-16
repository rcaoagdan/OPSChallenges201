#Script Name : Challenge 11
#Autor: Raymond Caoagdan
#Date of last revision : 03/13/2021
#Purpose : Automated Endpoint configurations
# Automate system configurations on Windows 10

# Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True #Turn on File and Printer Sharing
# Get-NetFirewallRule -Name (File and Printer Sharing) #view status of file and printer sharing

 # netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4 #Allow ICMP traffic

 # reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f #remtoe management
 # Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' #view remote management


 # iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/debloat')) #remove bloateware
 # Get-AppxPackage -name " " | Remove-AppxPackage #removebloatware
# DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename #view bloatware
# DISM /Online /Remove-ProvisionedAppxPackage /PackageName:PACKAGENAME #remove bloatware

 # Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All #enable hyper v

 # Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force #smb1 disabled