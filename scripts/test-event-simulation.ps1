<#
.SYNOPSIS
Generates safe test events for the Hybrid Security Operations Lab.

.DESCRIPTION
This script is intended for controlled lab use only.
It simulates several types of events that can help validate logging, alerting,
and investigation workflows across Defender XDR, Sentinel, and related controls.

It does NOT contain real offensive tradecraft and should not be used in production.

.PARAMETER RunFailedLogonTest
Generates repeated failed authentication attempts.

.PARAMETER RunDefenderTest
Attempts to access a Microsoft Defender test URL that is safe for validation.

.PARAMETER RunPolicyViolationNote
Displays guidance for testing an Azure Policy deny scenario manually.

.EXAMPLE
.\test-event-simulation.ps1 -RunFailedLogonTest

.EXAMPLE
.\test-event-simulation.ps1 -RunDefenderTest

.EXAMPLE
.\test-event-simulation.ps1 -RunFailedLogonTest -RunDefenderTest -RunPolicyViolationNote
#>

param(
    [switch]$RunFailedLogonTest,
    [switch]$RunDefenderTest,
    [switch]$RunPolicyViolationNote
)

function Write-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host $Title -ForegroundColor Cyan
    Write-Host "==================================================" -ForegroundColor Cyan
}

if ($RunFailedLogonTest) {
    Write-Section "Running Failed Logon Simulation"

    $targetUser = "CONTOSO\finuser1"

    for ($i = 1; $i -le 10; $i++) {
        $badPassword = ConvertTo-SecureString "WrongPassword$i" -AsPlainText -Force
        $cred = New-Object System.Management.Automation.PSCredential ($targetUser, $badPassword)

        try {
            Start-Process cmd.exe -Credential $cred -ErrorAction Stop | Out-Null
        }
        catch {
            Write-Host "Failed logon attempt $i generated for $targetUser"
        }
    }

    Write-Host "Finished failed logon simulation."
}

if ($RunDefenderTest) {
    Write-Section "Running Microsoft Defender Safe Test"

    try {
        Invoke-WebRequest -Uri "https://demo.wd.microsoft.com/Page/Settings" -UseBasicParsing -ErrorAction Stop | Out-Null
        Write-Host "Defender demo/test page was reached successfully."
    }
    catch {
        Write-Host "Request completed with an expected warning or block, depending on your configuration."
    }

    Write-Host "Review Defender XDR and related telemetry after running this test."
}

if ($RunPolicyViolationNote) {
    Write-Section "Azure Policy Violation Guidance"

    Write-Host "To test Azure Policy deny behavior manually, try creating a resource without the required Department tag."
    Write-Host ""
    Write-Host "Example:"
    Write-Host 'az vm create --resource-group "RG-SECURITY-LAB" --name "BAD-VM" --image Win2019Datacenter --admin-username admin --admin-password <AzureAdminPasswordPlaceholder> --location eastus'
    Write-Host ""
    Write-Host "Expected result: deployment should fail if the tag policy is working correctly."
}

if (-not ($RunFailedLogonTest -or $RunDefenderTest -or $RunPolicyViolationNote)) {
    Write-Section "No Test Selected"
    Write-Host "Use one or more switches:"
    Write-Host " -RunFailedLogonTest"
    Write-Host " -RunDefenderTest"
    Write-Host " -RunPolicyViolationNote"
}