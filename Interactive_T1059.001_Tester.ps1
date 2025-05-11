
<#
.SYNOPSIS
  PowerShell Technique Test Script - MITRE T1059.001 (PowerShell)

.DESCRIPTION
  This script presents a menu to the user to test various PowerShell commands that simulate attacker behavior
  as described in the MITRE ATT&CK framework under technique T1059.001.

.NOTES
  Author: ChatGPT
  Usage: Run this script in a test or lab environment only.
#>

function Show-Menu {
    Write-Host "`n=== PowerShell Technique Test Menu ===" -ForegroundColor Cyan
    Write-Host "1. Basic PowerShell Execution"
    Write-Host "2. Bypass Execution Policy"
    Write-Host "3. Encoded Command Execution"
    Write-Host "4. Simulate File Download"
    Write-Host "5. Invoke-Expression Execution"
    Write-Host "6. List Running Processes"
    Write-Host "7. List Running Services"
    Write-Host "8. Read File Contents"
    Write-Host "9. Obfuscated Command Execution"
    Write-Host "10. Write Output to File"
    Write-Host "11. Check Local Admin Privileges"
    Write-Host "0. Exit"
}

function Run-Test {
    param ($choice)
    switch ($choice) {
        1  { Write-Host "Test 1: Basic Execution" -ForegroundColor Green; Write-Host "Test PowerShell execution" }
        2  { Write-Host "Test 2: Bypass Execution Policy" -ForegroundColor Green; powershell -ExecutionPolicy Bypass -Command "Write-Host 'Policy Bypassed'" }
        3  { Write-Host "Test 3: Encoded Command" -ForegroundColor Green; powershell -EncodedCommand VwByAGkAdABlAC0ASABvAHMAdAAgACIASQBlAGMAdQB0AGkAbwBuACAAVABlAHMAdAAgAEUAbgBjAG8AZABlAGQAIgA= }
        4  { Write-Host "Test 4: Simulate File Download" -ForegroundColor Green; $wc = New-Object System.Net.WebClient; $wc.DownloadString("http://example.com") }
        5  { Write-Host "Test 5: Invoke-Expression" -ForegroundColor Green; $code = 'Write-Host "Running IEX command"'; Invoke-Expression $code }
        6  { Write-Host "Test 6: List Processes" -ForegroundColor Green; Get-Process }
        7  { Write-Host "Test 7: List Services" -ForegroundColor Green; Get-Service | Where-Object {$_.Status -eq "Running"} }
        8  { Write-Host "Test 8: Read Hosts File" -ForegroundColor Green; Get-Content C:\Windows\System32\drivers\etc\hosts }
        9  { Write-Host "Test 9: Obfuscated Execution" -ForegroundColor Green; iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("VwByAGkAdABlAC0ASABvAHMAdAAgACIATwBiAGYAdQBzAGMAYQB0AGUAZAAgAEMAbwBtAG0AYQBuAGQAIgA="))) }
        10 { Write-Host "Test 10: Write to File" -ForegroundColor Green; "Test Output" | Out-File C:\Temp\output.txt; Write-Host "Written to C:\Temp\output.txt" }
        11 { Write-Host "Test 11: Admin Check" -ForegroundColor Green; ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator") }
        0  { Write-Host "Exiting..." -ForegroundColor Yellow; exit }
        default { Write-Host "Invalid choice, try again." -ForegroundColor Red }
    }
}

do {
    Show-Menu
    $userChoice = Read-Host "Enter your choice (0-11)"
    Run-Test -choice $userChoice
} while ($true)
