
# PowerShell Command Test Script for MITRE T1059.001

# 1. Basic PowerShell Execution
Write-Host "Test PowerShell execution"

# 2. Bypass Execution Policy
powershell -ExecutionPolicy Bypass -Command "Write-Host 'Policy Bypassed'"

# 3. Encoded Command Execution (Decodes to: Write-Host "Iecution Test Encoded")
powershell -EncodedCommand VwByAGkAdABlAC0ASABvAHMAdAAgACIASQBlAGMAdQB0AGkAbwBuACAAVABlAHMAdAAgAEUAbgBjAG8AZABlAGQAIgA=

# 4. Simulated File Download from Internet
$wc = New-Object System.Net.WebClient
$wc.DownloadString("http://example.com")

# 5. Invoke-Expression Execution
$code = 'Write-Host "Running IEX command"'
Invoke-Expression $code

# 6. List Running Processes
Get-Process

# 7. List Running Services
Get-Service | Where-Object {$_.Status -eq "Running"}

# 8. Read File Contents
Get-Content C:\Windows\System32\drivers\etc\hosts

# 9. Obfuscated Command Execution (Decodes to: Write-Host "Obfuscated Command")
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("VwByAGkAdABlAC0ASABvAHMAdAAgACIATwBiAGYAdQBzAGMAYQB0AGUAZAAgAEMAbwBtAG0AYQBuAGQAIgA=")))

# 10. Write Output to a File
"Test Output" | Out-File C:\Temp\output.txt

# 11. Check Local Admin Privileges
([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
