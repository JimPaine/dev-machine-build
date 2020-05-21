# dev-machine-build

```
$currentPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
Invoke-WebRequest "https://raw.githubusercontent.com/JimPaine/dev-machine-build/master/build.ps1" -outfile build.ps1
.\build.ps1
Set-ExecutionPolicy -ExecutionPolicy $currentPolicy -Force
```