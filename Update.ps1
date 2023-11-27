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
[string]$latest = "12.5.17000";
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
# MIISLAYJKoZIhvcNAQcCoIISHTCCEhkCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUH4qyvO4Yy5Y2RWBTDAnQ+shd
# pWaggg54MIIGsDCCBJigAwIBAgIQCK1AsmDSnEyfXs2pvZOu2TANBgkqhkiG9w0B
# AQwFADBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQDExhEaWdpQ2VydCBUcnVzdGVk
# IFJvb3QgRzQwHhcNMjEwNDI5MDAwMDAwWhcNMzYwNDI4MjM1OTU5WjBpMQswCQYD
# VQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xQTA/BgNVBAMTOERpZ2lD
# ZXJ0IFRydXN0ZWQgRzQgQ29kZSBTaWduaW5nIFJTQTQwOTYgU0hBMzg0IDIwMjEg
# Q0ExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA1bQvQtAorXi3XdU5
# WRuxiEL1M4zrPYGXcMW7xIUmMJ+kjmjYXPXrNCQH4UtP03hD9BfXHtr50tVnGlJP
# DqFX/IiZwZHMgQM+TXAkZLON4gh9NH1MgFcSa0OamfLFOx/y78tHWhOmTLMBICXz
# ENOLsvsI8IrgnQnAZaf6mIBJNYc9URnokCF4RS6hnyzhGMIazMXuk0lwQjKP+8bq
# HPNlaJGiTUyCEUhSaN4QvRRXXegYE2XFf7JPhSxIpFaENdb5LpyqABXRN/4aBpTC
# fMjqGzLmysL0p6MDDnSlrzm2q2AS4+jWufcx4dyt5Big2MEjR0ezoQ9uo6ttmAaD
# G7dqZy3SvUQakhCBj7A7CdfHmzJawv9qYFSLScGT7eG0XOBv6yb5jNWy+TgQ5urO
# kfW+0/tvk2E0XLyTRSiDNipmKF+wc86LJiUGsoPUXPYVGUztYuBeM/Lo6OwKp7AD
# K5GyNnm+960IHnWmZcy740hQ83eRGv7bUKJGyGFYmPV8AhY8gyitOYbs1LcNU9D4
# R+Z1MI3sMJN2FKZbS110YU0/EpF23r9Yy3IQKUHw1cVtJnZoEUETWJrcJisB9IlN
# Wdt4z4FKPkBHX8mBUHOFECMhWWCKZFTBzCEa6DgZfGYczXg4RTCZT/9jT0y7qg0I
# U0F8WD1Hs/q27IwyCQLMbDwMVhECAwEAAaOCAVkwggFVMBIGA1UdEwEB/wQIMAYB
# Af8CAQAwHQYDVR0OBBYEFGg34Ou2O/hfEYb7/mF7CIhl9E5CMB8GA1UdIwQYMBaA
# FOzX44LScV1kTN8uZz/nupiuHA9PMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUEDDAK
# BggrBgEFBQcDAzB3BggrBgEFBQcBAQRrMGkwJAYIKwYBBQUHMAGGGGh0dHA6Ly9v
# Y3NwLmRpZ2ljZXJ0LmNvbTBBBggrBgEFBQcwAoY1aHR0cDovL2NhY2VydHMuZGln
# aWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZFJvb3RHNC5jcnQwQwYDVR0fBDwwOjA4
# oDagNIYyaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZFJv
# b3RHNC5jcmwwHAYDVR0gBBUwEzAHBgVngQwBAzAIBgZngQwBBAEwDQYJKoZIhvcN
# AQEMBQADggIBADojRD2NCHbuj7w6mdNW4AIapfhINPMstuZ0ZveUcrEAyq9sMCcT
# Ep6QRJ9L/Z6jfCbVN7w6XUhtldU/SfQnuxaBRVD9nL22heB2fjdxyyL3WqqQz/WT
# auPrINHVUHmImoqKwba9oUgYftzYgBoRGRjNYZmBVvbJ43bnxOQbX0P4PpT/djk9
# ntSZz0rdKOtfJqGVWEjVGv7XJz/9kNF2ht0csGBc8w2o7uCJob054ThO2m67Np37
# 5SFTWsPK6Wrxoj7bQ7gzyE84FJKZ9d3OVG3ZXQIUH0AzfAPilbLCIXVzUstG2MQ0
# HKKlS43Nb3Y3LIU/Gs4m6Ri+kAewQ3+ViCCCcPDMyu/9KTVcH4k4Vfc3iosJocsL
# 6TEa/y4ZXDlx4b6cpwoG1iZnt5LmTl/eeqxJzy6kdJKt2zyknIYf48FWGysj/4+1
# 6oh7cGvmoLr9Oj9FpsToFpFSi0HASIRLlk2rREDjjfAVKM7t8RhWByovEMQMCGQ8
# M4+uKIw8y4+ICw2/O/TOHnuO77Xry7fwdxPm5yg/rBKupS8ibEH5glwVZsxsDsrF
# hsP2JjMMB0ug0wcCampAMEhLNKhRILutG4UI4lkNbcoFUCvqShyepf2gpx8GdOfy
# 1lKQ/a+FSCH5Vzu0nAPthkX0tGFuv2jiJmCG6sivqf6UHedjGzqGVnhOMIIHwDCC
# BaigAwIBAgIQDJndqvjv6TESF24R/OFQ0jANBgkqhkiG9w0BAQsFADBpMQswCQYD
# VQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xQTA/BgNVBAMTOERpZ2lD
# ZXJ0IFRydXN0ZWQgRzQgQ29kZSBTaWduaW5nIFJTQTQwOTYgU0hBMzg0IDIwMjEg
# Q0ExMB4XDTIzMDQyNDAwMDAwMFoXDTI0MDUwNjIzNTk1OVowgcgxEzARBgsrBgEE
# AYI3PAIBAxMCVVMxGTAXBgsrBgEEAYI3PAIBAhMIRGVsYXdhcmUxHTAbBgNVBA8M
# FFByaXZhdGUgT3JnYW5pemF0aW9uMRAwDgYDVQQFEwc2MTg1NTg2MQswCQYDVQQG
# EwJVUzEQMA4GA1UECBMHQXJpem9uYTEOMAwGA1UEBxMFVGVtcGUxGjAYBgNVBAoT
# EUFDUk9OSVMgU0NTLCBJTkMuMRowGAYDVQQDExFBQ1JPTklTIFNDUywgSU5DLjCC
# AiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANFNqYlGUioDatkeybs5wcWm
# FKz7ov4XpWCf4/d0ZJwjmXEKbhxyrDfh4QeRoj+0dwmilP5+Yn5tlqBw6jGTWt7g
# 0OEIEqI0+8kmNYViY1qF9881o+y7xrvoa/FrUFaSvEK9ap424aOyiGqgy2Ad7O80
# RHA/rAuamMTRX+hsrMHu2YNsBLv7cSed4omHWTWjZV6yrderODYbOTfMOypP9b4A
# W0plkPMgrrdxKW35YQQyrUA0TrzpGT3QbmQsjr+E7QRz81WCrfg3y8MVqEznbwfz
# gsoA6JYeLlKzLRG1QTVM2Lrk0jwLhPUo0OFJHAmCy83tDHLtggxcFI9Cjiu/j+bU
# pevEgZGXPsiAhYGRpaqs5wMcCH+iJT6g7Pjg3kh/CqvikP529Nz0ulDgh8x4KfpY
# zDoFxn/csaD9LqY6nqpaTXbOz3W6sfggqW6rklhJfRRH5EJ703leclI+I6oKkVfA
# 11HqdAzmMYZsSmsjxv6z5pNnZr5VRHjjuh6jZWepC8+dKxhtTs36UfDVn8OkeZaV
# rC9DJRdmGwoQR8JUTmlLxrAm7uUIFnKntnsS9skDpJ5NhP5pBDV67a54I7vyBlTX
# jN+llkdIEFk5JXgIIXtRwaYXvTLxXPh+B7tLFlkA15LSygub2JjGWMQw2TIcapQ2
# HYS3p961CBTNNDoup0JHAgMBAAGjggICMIIB/jAfBgNVHSMEGDAWgBRoN+Drtjv4
# XxGG+/5hewiIZfROQjAdBgNVHQ4EFgQUH4/3T1kuxuCYFQW6AIOLdHthF8MwDgYD
# VR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMIG1BgNVHR8Ega0wgaow
# U6BRoE+GTWh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRH
# NENvZGVTaWduaW5nUlNBNDA5NlNIQTM4NDIwMjFDQTEuY3JsMFOgUaBPhk1odHRw
# Oi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRDb2RlU2lnbmlu
# Z1JTQTQwOTZTSEEzODQyMDIxQ0ExLmNybDA9BgNVHSAENjA0MDIGBWeBDAEDMCkw
# JwYIKwYBBQUHAgEWG2h0dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzCBlAYIKwYB
# BQUHAQEEgYcwgYQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNv
# bTBcBggrBgEFBQcwAoZQaHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0VHJ1c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcnQw
# CQYDVR0TBAIwADANBgkqhkiG9w0BAQsFAAOCAgEATE02Gi6uEpA3lfi0QZrrO4i+
# LVd5vumNseXjlwR79C6ZY6LF8AeaNnEKryHCtIIHH+4jj62NbgL74gaYwbsSoexC
# ZAdVMD28TTQ8N3H6eJ5TiKAhVieMjIrQGNVWEJAz1bogN9r0d9Vqdmt79VfJ6DiO
# COlzXrmOt2v4Cv813rswVK8bj32+rlR1w5wUa4r5UF7rLZKHooFupZUHPHRvJRK+
# SDAGu9fzAiq8bMKqcKIJVMU83Mng8g8/zbrjxiwmnUeRNBJkxPzqyptWi3Vm77ww
# ZzBwu8lsvKReAGQgIaqiM9pFJFWWR97r0n4etV+yQIwMsgKDJHc49GzQXXvV1t8y
# q/dBYj2P5OkythlM4NBuYdV/b+h9GfnaAI+bTw5anKoaqg0w6boLY5mgCdbt6UbT
# Sn6MXSEsfYBZElLOrHmSADK7eFA6aIFG9WjewbBvHqYsKbs7Y3xCuAsPg/PxUsoc
# 5YClpPF2fSRol5R8V/7AocPd6IPS9ba46oo2h7Xzh7gL+UU8+Qs4UwnQ89Ly4TpV
# Fw+kO47p1eATGvgjip6V/67wIufF8x2RdtbMyH3O4NDyJEtwjxzFo+rPK2lrrig/
# HD1XbFxc5qNwKCs65B2ch+kcgBKXCZMJtNZeUHz0plohhIagYyFgIGR1tyVcBDkJ
# O3/CvPzy9unEZuPy7awxggMeMIIDGgIBATB9MGkxCzAJBgNVBAYTAlVTMRcwFQYD
# VQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBH
# NCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEzODQgMjAyMSBDQTECEAyZ3ar47+kx
# EhduEfzhUNIwCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAw
# GQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisG
# AQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFEV2XHpJWJlhhXVkag/pKwYRPAFDMA0G
# CSqGSIb3DQEBAQUABIICACZVYF6G2ODYyWpwUY3ki8igawyBCQ5eDTaJXESvzFWJ
# Ogmmaph7hvyim49ZwyWsVbOS3+mnIZS4z3llZQaBxhkJXX63A1KKwT19ZgUldWqm
# 2IJryt+2hactsinHegjKCH+YkJA3wU+5bFDiRFzu9T9X7P2M4EY8U6f5wd9PGfhF
# xEsapAUBUMOIcgG0tkCBacvadx4MPiLCi/rYDIrKIThAnywdKbJCmvCqbO2xwHxl
# e8EiLOrPZCKz/1bDNuf1cpSrLkuGfwkqwSI3f8ZRnxYEc9OE9DiXUEedIZAMJ8zr
# cfwEKIwM6yooEn3bVSJKr0Gu2CS6gGj8lz2p8Jv08ACx65+J2zjOOPV4WF/1oLGe
# +2cvX+n4tK6dcYW5R869ESgLrd7YjCAWddsezFIc69+CdfQPZ7i6pMZ8z6zj+z2Y
# dSzas0RFw/EvsIFQjD3Dd9NXldGEIg4Mm+dft2GrHCggdTc19QaKPqAEYd4t95g1
# lJD9j+Y8cFpPuKfsYQeexH/8WO8EspYheloaEJv7Td+Bx3ft5NGLywzcuniNWT9p
# k52a8peGVqZiBX57U61YVjOghdFKpkgtYkfkl8/WbHC4fUdT2JAqMO2zmzzb1E2v
# COyblgvQg2ogiu21dIIquPu+nDUxmzijsFenrlGnsKYHAkPDzqDA5AVIv04P+QDc
# SIG # End signature block
