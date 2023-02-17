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
[string]$latest = "12.5.16903";
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
# MIISZAYJKoZIhvcNAQcCoIISVTCCElECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUn/pYBI9KElhLR5rqOxisaOgR
# 66Sggg6wMIIGsDCCBJigAwIBAgIQCK1AsmDSnEyfXs2pvZOu2TANBgkqhkiG9w0B
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
# 1lKQ/a+FSCH5Vzu0nAPthkX0tGFuv2jiJmCG6sivqf6UHedjGzqGVnhOMIIH+DCC
# BeCgAwIBAgIQDkJ3zwlS6GTOvjhj1WiFhDANBgkqhkiG9w0BAQsFADBpMQswCQYD
# VQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xQTA/BgNVBAMTOERpZ2lD
# ZXJ0IFRydXN0ZWQgRzQgQ29kZSBTaWduaW5nIFJTQTQwOTYgU0hBMzg0IDIwMjEg
# Q0ExMB4XDTIyMDUwNTAwMDAwMFoXDTIzMDUwNDIzNTk1OVowgc0xEzARBgsrBgEE
# AYI3PAIBAxMCVVMxGTAXBgsrBgEEAYI3PAIBAhMIRGVsYXdhcmUxHTAbBgNVBA8M
# FFByaXZhdGUgT3JnYW5pemF0aW9uMRAwDgYDVQQFEwc2MTg1NTg2MQswCQYDVQQG
# EwJVUzEQMA4GA1UECBMHQXJpem9uYTETMBEGA1UEBxMKU2NvdHRzZGFsZTEaMBgG
# A1UEChMRQUNST05JUyBTQ1MsIElOQy4xGjAYBgNVBAMTEUFDUk9OSVMgU0NTLCBJ
# TkMuMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEArE0mwp/nDHul7Z97
# A0jNYCkrme4fOJGZVckrj4Ci+VMV8xUqEclzZqUVSE7kDpYFXYpxIP4kDPn2+8h2
# z2Sh7PIJFrRrLY6p8J3WoDIXCYQqZRAVeFHYYE0HU2YeFdrmLX4AbKNoD4JdiUxF
# 0fDdW3l0wioWEXtMw0IrAV9ZQDHTWs4f63OgreEf+uZehtrM8Kdz844h6CV+TnHx
# HjWuTqfT4Ut+E+HoA1flzleRO1zOdLwkibO8YZ+s26cq3RyWIyGNE1Uv3wAuuNjI
# bzhAVUy8HndYX7libhupMGXo8hXRu5kf4xVjmAwQZdQvD1n1Vid3YTUaYXxFPHZf
# nxlxk2G6fWfxvGxyqfeJnzFJ8xXe+1vLjWEbcJxc+SgSIP6i1QDBrPQsWtd99FOp
# aVNVKbzQs1imNyTcfcmB5LPr0NPu/JOrOTdMimtMb8VpgNazjCNzSS2j6otYE2tN
# ZRwRAh9iktSJ0fi67b1YHdAxTMeAhvVmetvtrgkuw/OvANoZJMR983Xxii9HHxJY
# 6AikHqm68hWKl1rDfKMl4qOCuF3VgtFC5bdcl6Sx8TPvJvubCgIpeTyXa5mKiPPt
# NAi4MuGnuWmoml3agv/GoPDeOJNGAcsBKdApa+OPSnajGYJlQidouVYtEWCYOTBS
# KsvIjVgWT1GyPgvMScCgbl5EE7MCAwEAAaOCAjUwggIxMB8GA1UdIwQYMBaAFGg3
# 4Ou2O/hfEYb7/mF7CIhl9E5CMB0GA1UdDgQWBBQxuunR/8gnrSN9rBdTzh/6emI8
# FzAuBgNVHREEJzAloCMGCCsGAQUFBwgDoBcwFQwTVVMtREVMQVdBUkUtNjE4NTU4
# NjAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwgbUGA1UdHwSB
# rTCBqjBToFGgT4ZNaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1
# c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcmwwU6BRoE+G
# TWh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNENvZGVT
# aWduaW5nUlNBNDA5NlNIQTM4NDIwMjFDQTEuY3JsMD0GA1UdIAQ2MDQwMgYFZ4EM
# AQMwKTAnBggrBgEFBQcCARYbaHR0cDovL3d3dy5kaWdpY2VydC5jb20vQ1BTMIGU
# BggrBgEFBQcBAQSBhzCBhDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNl
# cnQuY29tMFwGCCsGAQUFBzAChlBodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
# RGlnaUNlcnRUcnVzdGVkRzRDb2RlU2lnbmluZ1JTQTQwOTZTSEEzODQyMDIxQ0Ex
# LmNydDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4ICAQAn64d8wvIkQxPv
# eSw/qQY+zkIIco8YuyGm8U2p4zcu0i19+7uZw9MisWU5/KCI2wYfvS5e7eZDekZ9
# 6/5uezdEz7ZFyEVwrW5rAWJwZ95SLSvAfBBQXSebFCKKfExwClTtfhDZZmiNxiPK
# 1UJ8O4Zp3CMGa1Ih/AdrmVQen+9fyOLHpEqf+HjGiVvN4QYhip1G8px3bq96uGn4
# ZynSr9T2jx2hWmTSkTzKgNSUL07OPJviNnmf1Wkc9MrbIfpxFLGzVuPP+Xdzto3k
# 67Y/fENaqeBgtk5+qNWJKBWN9qUHVU0/YozXqPE9T2+ayt/18H0arWO5uFjopumN
# jgVy72ciwf9fiSVVVT43QEgUVpDMbVKrYwCeObg+lnOPVr6IAiIXk4CxG8Ei5RxW
# cCZBaH0ntQ3VWKJSbJ3ZN6lOiE7xyYAPX0cEbwf3MAHma4GgwbRn4+3RX7RVpbzT
# +KhGkn8hsEEjbsPHNQV086+/i371gs/VKivJyzqC30F2hjY/eOso3dVhuNwXQUti
# +5yH5MiDiMEIEQ68XaJT2+zAwLWLD5bajvXZdhewGWxf2/2k1wKG3zinDXV1GjsR
# F96WllA7SMrTHNrtAecce7FTNYqz/Hk2fZyPL8K49tCRoUhx8igS8mZ2B53Y9gJT
# soutH7MH4+PICWWSGH3yT9T62NQ0nDGCAx4wggMaAgEBMH0waTELMAkGA1UEBhMC
# VVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMUEwPwYDVQQDEzhEaWdpQ2VydCBU
# cnVzdGVkIEc0IENvZGUgU2lnbmluZyBSU0E0MDk2IFNIQTM4NCAyMDIxIENBMQIQ
# DkJ3zwlS6GTOvjhj1WiFhDAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU7umQx3Zy1aLgydGdeoWV
# /FLwraIwDQYJKoZIhvcNAQEBBQAEggIAWNy+6zbQ+J++MR0k+wRi0RRlCEDIeMJk
# qy09qoUb/+QfqoCBOxQUklsEfA//INR9+KD2DCmGN4pHL+Sov9vRxFTAgPQm+zKx
# DqdAXtphGQLhROZWicCm6KBOfK2opIUKB9FtOV8v0pUmlfPS9j2fWDx9dl/XRT5a
# ue2+hWoM4nJEdqGpHk58Iab0yjWoFx5oyHxUrfIp+voc6kLsh87EJ76YkD2gATX4
# +TDDyZFM8WoA6T4SJYqkQuaaWEbwu3R0drhwR0LjFq9XSt9kxZoD6FHYi3ERF/z2
# wm8I9qECUN3uH/3hVPN38bxR4U2HhFvt93V02JDSK/tyEV22/m+NH52GtghjgCFH
# 6ou/4i5z0gpYDwDujQ/P2xnW9U7PUnsO+NtNtzgaoVbvvcIF68+v6SJIfWZJSpa4
# 2kKQsUZARmtFvDZin6MSVfcGF2FhPxSPBfJ0C6TBgpQ9JCV5eEXUMbLoCJh7i0Xo
# Ns/eZW3cj62oJoB/Cugy/bmsHMxoezt/OJDjorsCrXjNvcbPGDifaSvZKE38MYlC
# 96OkP2pZxz0+yMWZ25RAMlTjfA0sYFnTJ5YmkvHq4vh3MZlm6FP9bUhv4p4iWxos
# 1q0sQNMHl5D5DMIbSEyVZVb0Wm1JFebnwF9MLYuEU0JyvtqsUCkQ8cDq3sk+MWl4
# LP21aUsRDmA=
# SIG # End signature block
