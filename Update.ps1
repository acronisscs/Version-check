# Usage: PowerShell.exe -NoProfile -ExecutionPolicy RemoteSigned -File .\Update.ps1
Write-Output ""
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object -Property DisplayName -Like 'Acronis*'|Select-Object -First 1).DisplayVersion
If (-Not $installed) {
  Write-Output "Acronis SCS Cyber Protect is not installed"
} else {
  Write-Output "Installed Version: $installed"
  $arrInstalled = $installed.Split('.') | % { [int]::Parse($_) }
}

try {
  $Response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/acronisscs/Version-check/master/Windows_Version_Number"
  $latest = $Response.Content.Trim()
  #Write-Output "Response.StatusCode=$($Response.StatusCode), Version=$latest"
} catch {
[string]$latest = "12.5.16866";
}
Write-Output "Latest Version: $latest"
$arrLatest = $latest.Split('.') | % { [int]::Parse($_) }

if ($installed) {
  if ($arrLatest[0] -gt $arrInstalled[0]) { Write-Output "Update Available" }
  elseif (($arrLatest[0] -eq $arrInstalled[0]) `
    -And ($arrLatest[1] -gt $arrInstalled[1])) { Write-Output "Update Available" }
  elseif (($arrLatest[0] -eq $arrInstalled[0]) `
    -And ($arrLatest[1] -eq $arrInstalled[1])  `
    -And ($arrLatest[2] -gt $arrInstalled[2])) { Write-Output "Update Available" }
  else { Write-Output "Installed version is the lastest, no update available" }
}
# SIG # Begin signature block
# MIIGogYJKoZIhvcNAQcCoIIGkzCCBo8CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUKnx1aT+YcHf0GSQftzc1mJMf
# COqgggP4MIID9DCCAtygAwIBAgIUMRD4rFmPPkT6yyJsWqnhNErkGyIwDQYJKoZI
# hvcNAQELBQAwWzELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAkFaMRMwEQYDVQQHDApT
# Y290dHNkYWxlMRQwEgYDVQQKDAtBY3JvbmlzIFNDUzEUMBIGA1UEAwwLQWNyb25p
# cyBTQ1MwHhcNMjIxMDEyMTgxMTU3WhcNMjUwNzA4MTgxMTU3WjCBnjELMAkGA1UE
# BhMCVVMxCzAJBgNVBAgMAkFaMRMwEQYDVQQHDApTY290dHNkYWxlMSMwIQYDVQQK
# DBpBY3JvbmlzIFNDUyBJbmMuIChPcGVuU1NMKTEjMCEGA1UECwwaQWNyb25pcyBT
# Q1MgSW5jLiAoT3BlblNTTCkxIzAhBgNVBAMMGkFjcm9uaXMgU0NTIEluYy4gKE9w
# ZW5TU0wpMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA8fwhAnktP2AX
# Qm4gJ/qqFuXVRRPnUYKtbnHULlNxOzBkUeoUG8ChkGTweBGFKthr2NZUzwMYgbUI
# WOupwowZVYleuLsLWZgpvWYbsWusV9JqgqmnP7njMEQrAMuhjd9aUJX4bEiQmgI2
# M/Tn+zcaa4ZP2Oc0BUS0co2tPmzhO5vCB0TuisVzyuqa4+siGuS4W3Dt2qu3Aa61
# qmsJ9VaC8AJx7VdWe2v3Y3SUQm/NkQoWW/JLSZTaR7kqLwgJ07bhXyRsLyZ5x5e2
# bJXtHlYCcp7R3CPfxa9wvMCE69MCDi7IQ+1yVPYgSIz6JT8diN7uu//Ahk7kdbT7
# 3ovgxfokfQIDAQABo2wwajAfBgNVHSMEGDAWgBRDizqPiD2bwVuNho29Pyes5pvZ
# UDAPBgNVHRMECDAGAQH/AgECMAsGA1UdDwQEAwIBBjATBgNVHSUEDDAKBggrBgEF
# BQcDAzAUBgNVHREEDTALgglsb2NhbGhvc3QwDQYJKoZIhvcNAQELBQADggEBABDi
# Kb58mZwYMxD/Q1KI7SmPWGzJpCyBcThvIwOjRXDpBNEo+UVt5WdEqt18TEhbO8y+
# CqU6dShumvKHo0bv7cKR6vxsQ8JSOHpyHBGA1QPfbxJ11+Tp/rJ20L+tZmW0yGZt
# gR0X6QEpRAVZ0Xm+gd0gT24nPdSX442op55Rf0nKHblDvcAvXs5kywlgdPF4opiC
# vr9J4+1d0Rey5olDSthP1bGQMeP90v/8O/+Yfa4iKU4vOBp9YJZ6qiOUtouvCXye
# 9/wKDA1wi1tr+ke3/OQFaeXLcqjcSq2OMuECeJFiITih5COAjwNsAyX38BifUjDd
# OQl+pTrTtCWWxU1HhHExggIUMIICEAIBATBzMFsxCzAJBgNVBAYTAlVTMQswCQYD
# VQQIDAJBWjETMBEGA1UEBwwKU2NvdHRzZGFsZTEUMBIGA1UECgwLQWNyb25pcyBT
# Q1MxFDASBgNVBAMMC0Fjcm9uaXMgU0NTAhQxEPisWY8+RPrLImxaqeE0SuQbIjAJ
# BgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0B
# CQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAj
# BgkqhkiG9w0BCQQxFgQU0ta6SpNJB9zcf5GmVmD8Eq8uMpgwDQYJKoZIhvcNAQEB
# BQAEggEAEL8oEk9+2f9NJt3Z2dFfM4qDtGOaol6fwvfnym21pgruI1cYVCB+iskb
# ldVigUJTH94Tc+/aQGUgAJoDinIVz9FpTIv1ZY8SWLFXoIvGFRA0aKKm4Orcsuzb
# erRCWxmn9m9H9giO+80reL+zHtSbE4/yYdiJ+ObZLiZLGH/1f0/aMcXndEgParOo
# AZCa0Kn++GMEJgJy2ewwbKYE+H358TcbfAiQk883M3XBpO2y5eUU08zIeBnX/LJL
# 9T3WP75AkWDABAepPuIo/DQxRghqN0u4xV4GJDbBc6dcIICdczIKIstf/hqjCD90
# uYHgvJL2yj3O8PU37+K+fs3hH+UuIg==
# SIG # End signature block
