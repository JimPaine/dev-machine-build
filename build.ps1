
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

Write-Output "Installing winget"
Start-Process c:\temp\winget.appxbundle
Read-Host "Press any key to continue when winget installer has compeleted, this will cause severavl restarts"

## Set Folder options
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Stop-Process -processname explorer


Write-Output "Installing and setting up WSL 2"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

wsl --set-default-version 2
winget install Canonical.Ubuntu
winget install Docker.DockerDesktop
winget install vscode

Write-Output "Installing VSCode extensions"
code --install-extension azuredevspaces.azds
code --install-extension eamodio.gitlens
code --install-extension felixfbecker.php-debug
code --install-extension humao.rest-client
code --install-extension johnpapa.vscode-peacock
code --install-extension mauve.terraform
code --install-extension ms-azure-devops.azure-pipelines
code --install-extension ms-azuretools.vscode-apimanagement
code --install-extension ms-azuretools.vscode-azureappservice
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension ms-azuretools.vscode-azureresourcegroups
code --install-extension ms-azuretools.vscode-azurestorage
code --install-extension ms-azuretools.vscode-azureterraform
code --install-extension ms-azuretools.vscode-azurevirtualmachines
code --install-extension ms-azuretools.vscode-cosmosdb
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-edgedevtools.vscode-edge-devtools
code --install-extension ms-kubernetes-tools.vscode-aks-tools
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-mssql.mssql
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-ssh-explorer
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.Go
code --install-extension ms-vscode.vscode-node-azure-pack
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsonline.vsonline
code --install-extension ms-vsts.team
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension naumovs.color-highlight
code --install-extension redhat.vscode-yaml
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension tuxtina.json2yaml
code --install-extension vsciot-vscode.azure-iot-toolkit

winget install Git.Git
winget install Github.cli
winget install Microsoft.AzureCli
winget install Microsoft.AzureCosmosEmulator
winget install Microsoft.StorageEmulator
winget install Microsoft.PowerBI
winget install Microsoft.PowerToys
winget install Microsoft.Teams

winget install Microsoft.VisualStudio.Enterprise
Read-Host "Press any key to continue when VS installer has compeleted"

winget install Microsoft.VisualStudioCode
winget install Microsoft.WindowsTerminal
winget install ".NET Core"
winget install Postman.Postman
winget install SlackTechnologies.Slack
winget install Spotify.Spotify
winget install WiresharkFoundation.WiresharkFoundation

