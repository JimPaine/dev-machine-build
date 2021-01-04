wsl --set-default-version 2
winget install Canonical.Ubuntu --version 20.04
$ubuntuApp = Get-StartApps | Where-Object {$_.Name -eq 'Ubuntu 20.04'} 
$ubuntuApp = "shell:AppsFolder\" + $ubuntuApp.AppID
Write-Output $ubuntuApp
Start-Process -FilePath $ubuntuApp

Write-Host "Press any key once you have setup WSL distro"
Read-Host

wsl --set-default Ubuntu-20.04
wsl --exec sudo ./wsl2.sh
