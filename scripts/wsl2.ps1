wsl --set-default-version 2
winget install Canonical.Ubuntu --version 18.04
$ubuntuApp = Get-StartApps | Where-Object {$_.Name -eq 'Ubuntu 18.04'} 
$ubuntuApp = "shell:AppsFolder\" + $ubuntuApp.AppID
Write-Output $ubuntuApp
Start-Process -FilePath $ubuntuApp

Write-Host "Press any key once you have setup WSL distro"
Read-Host