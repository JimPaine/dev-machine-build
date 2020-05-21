
Workflow Install-DevMachine {
    ## Set Folder options
    $key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
    Set-ItemProperty $key Hidden 1
    Set-ItemProperty $key HideFileExt 0
    Stop-Process -processname explorer
    
    Write-Output "Installing and setting up WSL 2"
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    
    Restart-Computer -Wait

    Start-Process powershell -ArgumentList "c:\temp\scripts\wsl2.ps1"
    Start-Process powershell -ArgumentList "c:\temp\scripts\vscode.ps1"
    Start-Process powershell -ArgumentList "c:\temp\scripts\packages.ps1"
    Start-Process powershell -ArgumentList "c:\temp\scripts\cleanup.ps1"
}


if(Test-Path "c:\temp" -PathType Container) {
    Write-Output "Temp dir already exists moving on."
}
else {
    Write-Output "Creating temp dir"
    New-Item -Path 'c:\temp' -ItemType Directory
}

if(Test-Path "c:\temp\winget.appxbundle" -PathType Leaf) {
    Write-Output "winget installer exists locally already"
}
else {    
    Write-Output "Downloading winget package manager"
    Invoke-WebRequest 'https://github.com/microsoft/winget-cli/releases/download/v0.1.4331-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle' -outfile c:\temp\winget.appxbundle
}

if(!(Test-Path "c:\temp\scripts" -PathType Container))
{
    Write-Output "Copying scripts to temp"
    Copy-Item scripts c:\temp -Recurse
}

Write-Output "Installing winget"
Start-Process c:\temp\winget.appxbundle
Read-Host "Press any key to continue when winget installer has compeleted, this will cause severavl restarts"

$RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
Set-ItemProperty $RunOnceKey "NextRun" ('C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe -executionPolicy Unrestricted -ArgumentList "Import-Module PSWorkflow; Get-Job -Name DevMachineSetup -State Suspended | Resume-Job"')

Install-DevMachine -JobName DevMachineSetup