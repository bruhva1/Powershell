#This script displays data about user's device and stores it into a file

#Creates a timestamp for file
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$systeminfo = ".\log_$timestamp.txt"


#Automatically grabs information using a variable
$recall = Get-ComputerInfo
$ipconfig = Get-NetIPConfiguration


#Add log timestamp
Add-Content -Path $systeminfo -Value "Log created on: $(Get-Date -Format 'yyyy-MM-dd_HHmmss')"


#Print and save system info
Write-Host "OS Version: $($recall.OsVersion)"
Add-Content -Path $systeminfo -Value "OS Version: $($recall.OsVersion)"

Write-Host "Computer Name: $($recall.CsName)"
Add-Content -Path $systeminfo -Value "Computer Name: $($recall.CsName)"

$cpucollect = ($recall.CsProcessors | ForEach-Object { $_.Name }) -join ', '
Write-Host "CPU Information: $cpucollect"
Add-Content -Path $systeminfo -Value "CPU Information: $cpucollect"

$ramcollect = ("{0:N2}" -f ($recall.CsTotalPhysicalMemory / 1GB))
Write-Host "Total RAM (GB): $ramcollect"
Add-Content -Path $systeminfo -Value "Total RAM (GB): $ramcollect"

Write-Host "n`IP Configuration:"
Add-Content -Path $systeminfo -Value ""
Add-Content -Path $systeminfo -Value "IP Configuration:"

	Write-Host " Interface: $($ipconfig.InterfaceAlias)"
	Add-Content -Path $systeminfo -Value " Interface: $($ipconfig.InterfaceAlias)"

	Write-Host " IPv4 Address: $($ipconfig.IPv4Address.IPAddress)"
	Add-Content -Path $systeminfo -Value " IPv4 Address: $($ipconfig.IPv4Address.IPAddress)"

	Write-Host " Default Gateway: $($ipconfig.IPv4DefaultGateway.NextHop)"
	Add-Content -Path $systeminfo -Value " Default Gateway: $($ipconfig.IPv4DefaultGateway.NextHop)"

	Write-Host ""
	Add-Content -Path $systeminfo -Value ""


#Prints where the data is stored in files
Write-Host "File has been saved at: $(Resolve-Path $systeminfo)"
