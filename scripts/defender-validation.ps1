<#
.SYNOPSIS
Performs basic validation checks for Defender, endpoint onboarding, and hybrid identity state.

.DESCRIPTION
This script is intended for lab validation only.
It checks Microsoft Defender status, key services, and hybrid identity registration status.
It is useful after onboarding endpoints or troubleshooting expected telemetry flow.

.EXAMPLE
.\defender-validation.ps1
#>

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "Microsoft Defender Validation Checks" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green

Write-Host "`n[1] Defender status"
try {
    Get-MpComputerStatus | Select-Object `
        AMRunningMode,
        AntivirusEnabled,
        RealTimeProtectionEnabled,
        IsTamperProtected,
        NISEnabled
}
catch {
    Write-Warning "Unable to retrieve Defender status."
}

Write-Host "`n[2] Defender-related services"
try {
    Get-Service WinDefend, Sense -ErrorAction Stop | Select-Object Name, Status, StartType
}
catch {
    Write-Warning "One or more Defender services were not found."
}

Write-Host "`n[3] Defender onboarding registry state"
try {
    Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Advanced Threat Protection" -ErrorAction Stop |
        Select-Object OnboardingState
}
catch {
    Write-Warning "Defender onboarding registry path was not found."
}

Write-Host "`n[4] Basic hybrid identity registration status"
try {
    dsregcmd /status
}
catch {
    Write-Warning "Unable to run dsregcmd /status."
}

Write-Host "`n[5] Optional connectivity check to Microsoft login endpoint"
try {
    Test-NetConnection -ComputerName "login.microsoftonline.com" -Port 443
}
catch {
    Write-Warning "Connectivity test could not be completed."
}

Write-Host "`nValidation checks complete."