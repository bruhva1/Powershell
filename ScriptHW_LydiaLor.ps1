#This script creates a file from user input and logs it into a folder

#Confirm folder existence
$logfolder = ".\PowerShellLog"
if (!(Test-Path -Path $logfolder)) {
	New-Item -ItemType Directory -Path $logfolder | Out-Null
}

#Creates a timestamp for log file
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$logfile = "$logfolder\log_$timestamp.txt"

do {
	#Ask for user information
	$name = Read-Host "Enter your name:"
	$age = Read-Host "Enter your age:"
	$email = Read-Host "Enter your email:"

	#Print output to confirm
	Write-Host "Name : $name`nAge : $age`nEmail : $email"
	$confirm = Read-Host "Is this correct? (yes/no)"

}
while ($confirm.ToLower().Trim() -ne "yes")

#Adds content into log file
Add-Content -Path $logfile -Value "Log created on: $(Get-Date -Format 'yyyy-MM-dd_HHmmss')"
Add-Content -Path $logfile -Value "Name : $name"
Add-Content -Path $logfile -Value "Age : $age"
Add-Content -Path $logfile -Value "Email : $email"
Add-Content -Path $logfile -Value "--------------------`n"

Write-Host "Thank you. Your information has been saved, $name."
Write-Host "File has been saved at: $(Resolve-Path $logfile)"

