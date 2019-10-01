$app = Get-WmiObject -Class Win32_Product -ComputerName . | Where-Object Name -like "Acronis Backup*"
$installed = $app.Version
echo "Installed Version: $installed"
$arrInstalled = $app.Version.Split('.')

try {
$Response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/acronisscs/Version-check/master/Version_Number.txt"
$latest = $Response.Content
$arrLatest = $Response.Content.Split('.')
} catch {
[string]$latest = "12.5.12596";
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