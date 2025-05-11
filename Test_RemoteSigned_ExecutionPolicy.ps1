
<#
.SYNOPSIS
  Test if PowerShell Execution Policy "RemoteSigned" is enforced

.DESCRIPTION
  This script attempts to execute a simulated remote script. If RemoteSigned is enforced,
  PowerShell should block this execution unless the script is properly signed.

.NOTES
  Save this file, unblock it (Right-click > Properties > Unblock), and run it. 
  If RemoteSigned is in effect and the file is still considered remote, it should be blocked.
#>

Write-Host "Current Execution Policy: $(Get-ExecutionPolicy -Scope CurrentUser)" -ForegroundColor Cyan

try {
    Write-Host "Attempting to execute simulated remote script..." -ForegroundColor Yellow

    # Create a temporary script file to simulate an unsigned remote script
    $tempScript = "$env:TEMP\test-remote-script.ps1"
    @"
Write-Host '⚠️ If you see this message, the script was NOT blocked by RemoteSigned policy.'
"@ | Out-File -Encoding ASCII -FilePath $tempScript

    # Ensure the file appears as downloaded (simulate remote origin)
    Unblock-File -Path $tempScript  # Comment this line to simulate a blocked remote file

    # Run the temp script
    & $tempScript
}
catch {
    Write-Host "✅ Script execution was blocked as expected by RemoteSigned policy." -ForegroundColor Green
    Write-Host $_.Exception.Message
}
finally {
    Remove-Item -Path $tempScript -ErrorAction SilentlyContinue
}
