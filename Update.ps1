$app = Get-WmiObject -Class Win32_Product -ComputerName . | Where-Object Name -like "Acronis*"
$installed = $app.Version
echo "Installed Version: $installed"
$arrInstalled = $app.Version.Split('.')

try {
$Response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/acronisscs/Version-check/master/Windows_Version_Number"
$latest = $Response.Content
} catch {
[string]$latest = "12.5.16709";
}
echo "Latest Version: $latest"
[array]$stringLatest = $latest.Split('.')
[array]$arrLatest = foreach($number in $stringLatest) {
try {
    [int]::parse($number)
    
}
catch {
   Invoke-Expression -Command $number;
    }
}

if ([int]$arrLatest[0] -gt [int]$arrInstalled[0]) { echo "Update Available" }
elseif (([int]$arrLatest[0] -eq [int]$arrInstalled[0]) -And ([int]$arrLatest[1] -gt [int]$arrInstalled[1])) { echo "Update Available" }
elseif (([int]$arrLatest[0] -eq [int]$arrInstalled[0]) -And ([int]$arrLatest[1] -eq [int]$arrInstalled[1]) -And ([int]$arrLatest[2] -gt [int]$arrInstalled[2])) { echo "Update Available" }
else { echo "Installed version is the lastest, no update available" }
# SIG # Begin signature block
# MIIPbgYJKoZIhvcNAQcCoIIPXzCCD1sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDi2Muta4tsWhvu
# KiXfbpF9bWhpSOSBtXklQrJ9pquy6aCCDJEwggXNMIIEtaADAgECAhACc7udGvtM
# 44Z36yExV8N/MA0GCSqGSIb3DQEBCwUAMGwxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKzApBgNV
# BAMTIkRpZ2lDZXJ0IEVWIENvZGUgU2lnbmluZyBDQSAoU0hBMikwHhcNMjAwMzA0
# MDAwMDAwWhcNMjEwNDEzMTIwMDAwWjCB4zETMBEGCysGAQQBgjc8AgEDEwJVUzEZ
# MBcGCysGAQQBgjc8AgECEwhEZWxhd2FyZTEdMBsGA1UEDwwUUHJpdmF0ZSBPcmdh
# bml6YXRpb24xEDAOBgNVBAUTBzYxODU1ODYxCzAJBgNVBAYTAlVTMRAwDgYDVQQI
# EwdBcml6b25hMRMwEQYDVQQHEwpTY290dHNkYWxlMRowGAYDVQQKExFBQ1JPTklT
# IFNDUywgSU5DLjEUMBIGA1UECxMLQWNyb25pcyBTQ1MxGjAYBgNVBAMTEUFDUk9O
# SVMgU0NTLCBJTkMuMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkaJv
# WVT4DwC+XEhdoAWVQVYT78doH3inrrMxWg7PVbxmgIzhpkyd1XXvGtp6dMGo0Nns
# Mdb6P6Q6Mre1KHnLNHQamQTZzsIC/9NVLo2ghCc+pldZMvaCPkfmfiVUpZdOtAtm
# PpG5WDeJCcxKfewL3UtWl1g5OLTWmU3rSKVHlBMcb1viiR0V7rMHqjWT8sGC8BtG
# e1r5NBO1mBJY1vXAj8lN+Rg2AKDTy605dW/bRw7zLU4+O3Al3NxJz/GL6u88RMu4
# 7HTvR0LU/Jou+/B6/Z7pBUrpt+VZZt3UGkbiu/F4rWIiLDAbW4Xy4slHLG7lqdLp
# rCwKXAawgHs3o5AqrQIDAQABo4IB8TCCAe0wHwYDVR0jBBgwFoAUj+h+8G0yagAF
# I8dwl2o6kP9r6tQwHQYDVR0OBBYEFNgZhWUnS3QDY5WZ6AAEmqCVlUhxMC4GA1Ud
# EQQnMCWgIwYIKwYBBQUHCAOgFzAVDBNVUy1ERUxBV0FSRS02MTg1NTg2MA4GA1Ud
# DwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzB7BgNVHR8EdDByMDegNaAz
# hjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRVZDb2RlU2lnbmluZ1NIQTItZzEu
# Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRVZDb2RlU2lnbmlu
# Z1NIQTItZzEuY3JsMEsGA1UdIAREMEIwNwYJYIZIAYb9bAMCMCowKAYIKwYBBQUH
# AgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwBwYFZ4EMAQMwfgYIKwYB
# BQUHAQEEcjBwMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20w
# SAYIKwYBBQUHMAKGPGh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2Vy
# dEVWQ29kZVNpZ25pbmdDQS1TSEEyLmNydDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3
# DQEBCwUAA4IBAQBnvngjj5h+4R/ITjvsUvVfm/uQ+WxoqdPapUBSX3Qx0yt5nCwq
# Lo/uhHdhYMaJ7pHi4NX6QLglTnI1iTsLpFYmX8F0l5koDcBSXUiNPYd/6p5WqAfT
# AYViRlgexhHfhnGKvMMDoPbMWP/ebqY2m6Q8IwYJv1gKLQAfAmKGVsOP8lMkOISY
# yTmRnaNjRA8oKNsDoNT4ru7tW1jtQcKvbJHOseyoGm6ivGrijss2s5WrQFcNRNbp
# Xun7NZspLIQpV0aMtZZ46F75CH6NPX7kMQMK7XQKdANbHhIVfPMBxj0XMrXz4CLD
# 5km5Wl6O5cdA5HLLRe0aBMbuB+RXju19CZtaMIIGvDCCBaSgAwIBAgIQA/G04V86
# gvEUlniz19hHXDANBgkqhkiG9w0BAQsFADBsMQswCQYDVQQGEwJVUzEVMBMGA1UE
# ChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSswKQYD
# VQQDEyJEaWdpQ2VydCBIaWdoIEFzc3VyYW5jZSBFViBSb290IENBMB4XDTEyMDQx
# ODEyMDAwMFoXDTI3MDQxODEyMDAwMFowbDELMAkGA1UEBhMCVVMxFTATBgNVBAoT
# DERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTErMCkGA1UE
# AxMiRGlnaUNlcnQgRVYgQ29kZSBTaWduaW5nIENBIChTSEEyKTCCASIwDQYJKoZI
# hvcNAQEBBQADggEPADCCAQoCggEBAKdT+g+ytRPxZM+EgPyugDXRttfHoyysGiys
# 8YSsOjUSOpKRulfkxMnzL6hIPLfWbtyXIrpReWGvQy8Nt5u0STGuRFg+pKGWp4dP
# I37DbGUkkFU+ocojfMVC6cR6YkWbfd5jdMueYyX4hJqarUVPrn0fyBPLdZvJ4eGK
# +AsMmPTKPtBFqnoepViTNjS+Ky4rMVhmtDIQn53wUqHv6D7TdvJAWtz6aj0bS612
# sIxc7ja6g+owqEze8QsqWEGIrgCJqwPRFoIgInbrXlQ4EmLh0nAk2+0fcNJkCYAt
# 4radzh/yuyHzbNvYsxl7ilCf7+w2Clyat0rTCKA5ef3dvz06CSUCAwEAAaOCA1gw
# ggNUMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/BAQDAgGGMBMGA1UdJQQM
# MAoGCCsGAQUFBwMDMH8GCCsGAQUFBwEBBHMwcTAkBggrBgEFBQcwAYYYaHR0cDov
# L29jc3AuZGlnaWNlcnQuY29tMEkGCCsGAQUFBzAChj1odHRwOi8vY2FjZXJ0cy5k
# aWdpY2VydC5jb20vRGlnaUNlcnRIaWdoQXNzdXJhbmNlRVZSb290Q0EuY3J0MIGP
# BgNVHR8EgYcwgYQwQKA+oDyGOmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
# Q2VydEhpZ2hBc3N1cmFuY2VFVlJvb3RDQS5jcmwwQKA+oDyGOmh0dHA6Ly9jcmw0
# LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEhpZ2hBc3N1cmFuY2VFVlJvb3RDQS5jcmww
# ggHEBgNVHSAEggG7MIIBtzCCAbMGCWCGSAGG/WwDAjCCAaQwOgYIKwYBBQUHAgEW
# Lmh0dHA6Ly93d3cuZGlnaWNlcnQuY29tL3NzbC1jcHMtcmVwb3NpdG9yeS5odG0w
# ggFkBggrBgEFBQcCAjCCAVYeggFSAEEAbgB5ACAAdQBzAGUAIABvAGYAIAB0AGgA
# aQBzACAAQwBlAHIAdABpAGYAaQBjAGEAdABlACAAYwBvAG4AcwB0AGkAdAB1AHQA
# ZQBzACAAYQBjAGMAZQBwAHQAYQBuAGMAZQAgAG8AZgAgAHQAaABlACAARABpAGcA
# aQBDAGUAcgB0ACAAQwBQAC8AQwBQAFMAIABhAG4AZAAgAHQAaABlACAAUgBlAGwA
# eQBpAG4AZwAgAFAAYQByAHQAeQAgAEEAZwByAGUAZQBtAGUAbgB0ACAAdwBoAGkA
# YwBoACAAbABpAG0AaQB0ACAAbABpAGEAYgBpAGwAaQB0AHkAIABhAG4AZAAgAGEA
# cgBlACAAaQBuAGMAbwByAHAAbwByAGEAdABlAGQAIABoAGUAcgBlAGkAbgAgAGIA
# eQAgAHIAZQBmAGUAcgBlAG4AYwBlAC4wHQYDVR0OBBYEFI/ofvBtMmoABSPHcJdq
# OpD/a+rUMB8GA1UdIwQYMBaAFLE+w2kD+L9HAdSYJhoIAu9jZCvDMA0GCSqGSIb3
# DQEBCwUAA4IBAQAZM0oMgTM32602yeTJOru1Gy56ouL0Q0IXnr9OoU3hsdvpgd2f
# AfLkiNXp/gn9IcHsXYDS8NbBQ8L+dyvb+deRM85s1bIZO+Yu1smTT4hAjs3h9X7x
# D8ZZVnLo62pBvRzVRtV8ScpmOBXBv+CRcHeH3MmNMckMKaIz7Y3ih82JjT8b/9Xg
# GpeLfNpt+6jGsjpma3sBs83YpjTsEgGrlVilxFNXqGDm5wISoLkjZKJNu3yBJWQh
# vs/uQhhDl7ulNwavTf8mpU1hS+xGQbhlzrh5ngiWC4GMijuPx5mMoypumG1eYcaW
# t4q5YS2TuOsOBEPX9f6m8GLUmWqlwcHwZJSAMYICMzCCAi8CAQEwgYAwbDELMAkG
# A1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRp
# Z2ljZXJ0LmNvbTErMCkGA1UEAxMiRGlnaUNlcnQgRVYgQ29kZSBTaWduaW5nIENB
# IChTSEEyKQIQAnO7nRr7TOOGd+shMVfDfzANBglghkgBZQMEAgEFAKCBhDAYBgor
# BgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEE
# MBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCBz
# sSX36ZfgUtLKV9SW8mFNHbd6ZCAfsfzsTwtsMOx4FTANBgkqhkiG9w0BAQEFAASC
# AQB0ryKKM832EkBezOK8sUYzStvIFr+ifPWddSgzYV3Bi93d8RXUN9W1G0/yILVT
# +sClXGGrSoAR8Vzeg8Nu+PkQxW4CHoDNY5lh6AgsGJ6bnOi7yQt64Awm7aK73yqL
# 01OYv0gGnP0boru8M+wTUxN8WuF/qJ+isIUa6UMGhEB7ZmmL+qDhUn8RmmaKXiz9
# 462trbUZaUiZugUiYLdxe4k/zSdG9mq3K93dQUUiPppA2KL2X2zPcTzx0hjUjJ8k
# 3Q+kChmRCa0R/vcnyboI0ySEyYGdHnk9xixraCS8Vha0sTwONtTSBfXlmMIRMGDz
# /vAq931Rzv8SgWWojYoZ9eN4
# SIG # End signature block
