# dev-machine-build

```
$currentPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Invoke-WebRequest "https://raw.githubusercontent.com/JimPaine/dev-machine-build/master/runme.ps1" -outfile runme.ps1
.\runme.ps1
Set-ExecutionPolicy -ExecutionPolicy $currentPolicy -Force
```