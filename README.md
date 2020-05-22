# dev-machine-build

> Currently work in progress!!
>
> Seems to have an issue with the restart after enabling WSL2


## How to run

Run the below in Powershell as administrator

```
$currentPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Invoke-WebRequest "https://raw.githubusercontent.com/JimPaine/dev-machine-build/master/runme.ps1" -outfile runme.ps1
.\runme.ps1
Set-ExecutionPolicy -ExecutionPolicy $currentPolicy -Force
```

## After reboot

The script will enable WSL2 using dism.exe and this requires a reboot before it can be used. To check the status of the workflow run the following in Powershell as administrator.

```
Import-Module PSWorkflow

Get-Job -Name DevMachineSetup
```

If the job is shown as "Suspended" then run the following for it to continue

```
Get-Job -Name DevMachineSetup -State Suspended | Resume-Job
```