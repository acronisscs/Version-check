$app = Get-WmiObject -Class Win32_Product -ComputerName . | Where-Object Name -like "Acronis*"
$installed = $app.Version
echo "Installed Version: $installed"
$arrInstalled = $app.Version.Split('.')

try {
$Response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/acronisscs/Version-check/master/Windows_Version_Number"
$latest = $Response.Content
} catch {
[string]$latest = "12.5.16753";
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
# MIIPSQYJKoZIhvcNAQcCoIIPOjCCDzYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUwvDjEJPbjvy2CNcUXcQkpsMf
# 2jygggyRMIIFzTCCBLWgAwIBAgIQAnO7nRr7TOOGd+shMVfDfzANBgkqhkiG9w0B
# AQsFADBsMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMSswKQYDVQQDEyJEaWdpQ2VydCBFViBDb2Rl
# IFNpZ25pbmcgQ0EgKFNIQTIpMB4XDTIwMDMwNDAwMDAwMFoXDTIxMDQxMzEyMDAw
# MFowgeMxEzARBgsrBgEEAYI3PAIBAxMCVVMxGTAXBgsrBgEEAYI3PAIBAhMIRGVs
# YXdhcmUxHTAbBgNVBA8MFFByaXZhdGUgT3JnYW5pemF0aW9uMRAwDgYDVQQFEwc2
# MTg1NTg2MQswCQYDVQQGEwJVUzEQMA4GA1UECBMHQXJpem9uYTETMBEGA1UEBxMK
# U2NvdHRzZGFsZTEaMBgGA1UEChMRQUNST05JUyBTQ1MsIElOQy4xFDASBgNVBAsT
# C0Fjcm9uaXMgU0NTMRowGAYDVQQDExFBQ1JPTklTIFNDUywgSU5DLjCCASIwDQYJ
# KoZIhvcNAQEBBQADggEPADCCAQoCggEBAJGib1lU+A8AvlxIXaAFlUFWE+/HaB94
# p66zMVoOz1W8ZoCM4aZMndV17xraenTBqNDZ7DHW+j+kOjK3tSh5yzR0GpkE2c7C
# Av/TVS6NoIQnPqZXWTL2gj5H5n4lVKWXTrQLZj6RuVg3iQnMSn3sC91LVpdYOTi0
# 1plN60ilR5QTHG9b4okdFe6zB6o1k/LBgvAbRnta+TQTtZgSWNb1wI/JTfkYNgCg
# 08utOXVv20cO8y1OPjtwJdzcSc/xi+rvPETLuOx070dC1PyaLvvwev2e6QVK6bfl
# WWbd1BpG4rvxeK1iIiwwG1uF8uLJRyxu5anS6awsClwGsIB7N6OQKq0CAwEAAaOC
# AfEwggHtMB8GA1UdIwQYMBaAFI/ofvBtMmoABSPHcJdqOpD/a+rUMB0GA1UdDgQW
# BBTYGYVlJ0t0A2OVmegABJqglZVIcTAuBgNVHREEJzAloCMGCCsGAQUFBwgDoBcw
# FQwTVVMtREVMQVdBUkUtNjE4NTU4NjAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAww
# CgYIKwYBBQUHAwMwewYDVR0fBHQwcjA3oDWgM4YxaHR0cDovL2NybDMuZGlnaWNl
# cnQuY29tL0VWQ29kZVNpZ25pbmdTSEEyLWcxLmNybDA3oDWgM4YxaHR0cDovL2Ny
# bDQuZGlnaWNlcnQuY29tL0VWQ29kZVNpZ25pbmdTSEEyLWcxLmNybDBLBgNVHSAE
# RDBCMDcGCWCGSAGG/WwDAjAqMCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy5kaWdp
# Y2VydC5jb20vQ1BTMAcGBWeBDAEDMH4GCCsGAQUFBwEBBHIwcDAkBggrBgEFBQcw
# AYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEgGCCsGAQUFBzAChjxodHRwOi8v
# Y2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRFVkNvZGVTaWduaW5nQ0EtU0hB
# Mi5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAQEAZ754I4+YfuEf
# yE477FL1X5v7kPlsaKnT2qVAUl90MdMreZwsKi6P7oR3YWDGie6R4uDV+kC4JU5y
# NYk7C6RWJl/BdJeZKA3AUl1IjT2Hf+qeVqgH0wGFYkZYHsYR34ZxirzDA6D2zFj/
# 3m6mNpukPCMGCb9YCi0AHwJihlbDj/JTJDiEmMk5kZ2jY0QPKCjbA6DU+K7u7VtY
# 7UHCr2yRzrHsqBpuorxq4o7LNrOVq0BXDUTW6V7p+zWbKSyEKVdGjLWWeOhe+Qh+
# jT1+5DEDCu10CnQDWx4SFXzzAcY9FzK18+Aiw+ZJuVpejuXHQORyy0XtGgTG7gfk
# V47tfQmbWjCCBrwwggWkoAMCAQICEAPxtOFfOoLxFJZ4s9fYR1wwDQYJKoZIhvcN
# AQELBQAwbDELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcG
# A1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTErMCkGA1UEAxMiRGlnaUNlcnQgSGlnaCBB
# c3N1cmFuY2UgRVYgUm9vdCBDQTAeFw0xMjA0MTgxMjAwMDBaFw0yNzA0MTgxMjAw
# MDBaMGwxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNV
# BAsTEHd3dy5kaWdpY2VydC5jb20xKzApBgNVBAMTIkRpZ2lDZXJ0IEVWIENvZGUg
# U2lnbmluZyBDQSAoU0hBMikwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCnU/oPsrUT8WTPhID8roA10bbXx6MsrBosrPGErDo1EjqSkbpX5MTJ8y+oSDy3
# 1m7clyK6UXlhr0MvDbebtEkxrkRYPqShlqeHTyN+w2xlJJBVPqHKI3zFQunEemJF
# m33eY3TLnmMl+ISamq1FT659H8gTy3WbyeHhivgLDJj0yj7QRap6HqVYkzY0visu
# KzFYZrQyEJ+d8FKh7+g+03byQFrc+mo9G0utdrCMXO42uoPqMKhM3vELKlhBiK4A
# iasD0RaCICJ2615UOBJi4dJwJNvtH3DSZAmALeK2nc4f8rsh82zb2LMZe4pQn+/s
# NgpcmrdK0wigOXn93b89OgklAgMBAAGjggNYMIIDVDASBgNVHRMBAf8ECDAGAQH/
# AgEAMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUEDDAKBggrBgEFBQcDAzB/BggrBgEF
# BQcBAQRzMHEwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBJ
# BggrBgEFBQcwAoY9aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
# SGlnaEFzc3VyYW5jZUVWUm9vdENBLmNydDCBjwYDVR0fBIGHMIGEMECgPqA8hjpo
# dHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRIaWdoQXNzdXJhbmNlRVZS
# b290Q0EuY3JsMECgPqA8hjpodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNl
# cnRIaWdoQXNzdXJhbmNlRVZSb290Q0EuY3JsMIIBxAYDVR0gBIIBuzCCAbcwggGz
# BglghkgBhv1sAwIwggGkMDoGCCsGAQUFBwIBFi5odHRwOi8vd3d3LmRpZ2ljZXJ0
# LmNvbS9zc2wtY3BzLXJlcG9zaXRvcnkuaHRtMIIBZAYIKwYBBQUHAgIwggFWHoIB
# UgBBAG4AeQAgAHUAcwBlACAAbwBmACAAdABoAGkAcwAgAEMAZQByAHQAaQBmAGkA
# YwBhAHQAZQAgAGMAbwBuAHMAdABpAHQAdQB0AGUAcwAgAGEAYwBjAGUAcAB0AGEA
# bgBjAGUAIABvAGYAIAB0AGgAZQAgAEQAaQBnAGkAQwBlAHIAdAAgAEMAUAAvAEMA
# UABTACAAYQBuAGQAIAB0AGgAZQAgAFIAZQBsAHkAaQBuAGcAIABQAGEAcgB0AHkA
# IABBAGcAcgBlAGUAbQBlAG4AdAAgAHcAaABpAGMAaAAgAGwAaQBtAGkAdAAgAGwA
# aQBhAGIAaQBsAGkAdAB5ACAAYQBuAGQAIABhAHIAZQAgAGkAbgBjAG8AcgBwAG8A
# cgBhAHQAZQBkACAAaABlAHIAZQBpAG4AIABiAHkAIAByAGUAZgBlAHIAZQBuAGMA
# ZQAuMB0GA1UdDgQWBBSP6H7wbTJqAAUjx3CXajqQ/2vq1DAfBgNVHSMEGDAWgBSx
# PsNpA/i/RwHUmCYaCALvY2QrwzANBgkqhkiG9w0BAQsFAAOCAQEAGTNKDIEzN9ut
# NsnkyTq7tRsueqLi9ENCF56/TqFN4bHb6YHdnwHy5IjV6f4J/SHB7F2A0vDWwUPC
# /ncr2/nXkTPObNWyGTvmLtbJk0+IQI7N4fV+8Q/GWVZy6OtqQb0c1UbVfEnKZjgV
# wb/gkXB3h9zJjTHJDCmiM+2N4ofNiY0/G//V4BqXi3zabfuoxrI6Zmt7AbPN2KY0
# 7BIBq5VYpcRTV6hg5ucCEqC5I2SiTbt8gSVkIb7P7kIYQ5e7pTcGr03/JqVNYUvs
# RkG4Zc64eZ4IlguBjIo7j8eZjKMqbphtXmHGlreKuWEtk7jrDgRD1/X+pvBi1Jlq
# pcHB8GSUgDGCAiIwggIeAgEBMIGAMGwxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxE
# aWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKzApBgNVBAMT
# IkRpZ2lDZXJ0IEVWIENvZGUgU2lnbmluZyBDQSAoU0hBMikCEAJzu50a+0zjhnfr
# ITFXw38wCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJ
# KoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQB
# gjcCARUwIwYJKoZIhvcNAQkEMRYEFGj9jptzfz+x0BFVCaTFy/BwjkKZMA0GCSqG
# SIb3DQEBAQUABIIBACNdS6qGRcmZYhKysIbvpjbqFeQprkUXOtU/54YmnBI13Xh3
# C6yBJzKhUnthw/q1xK8/L9obHeFeDcButN3zW5d6lFurl9XVMGeK7V6HuCP/GbTn
# mAsThxBCsVyv6ISV3jgbSUgU1l/wtdOkOIu03pp8B0YDOlu6T1VAbxYCwoCOpU3O
# ff+FQLWGPqKr6ioTXGV7Zoe7a+6Y2iqj3as2GuMgZt6JfKQj0/YHlqvI+yhV2HXJ
# f4h7usDH/7XsfG0dfWyiDZWPMaG1Q2QAMZbU4aaUcB4uWyIsES1A0r3ij6lI7LlT
# c6hF+klMcNxcIn68I9kmDo7B/6MJ9VK+R4l0tuo=
# SIG # End signature block
