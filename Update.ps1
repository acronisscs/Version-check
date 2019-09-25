$app = Get-WmiObject -Class Win32_Product -ComputerName . | Where-Object Name -like "Acronis Backup*"
$installed = $app.Version
echo "Installed Version: $installed"
$arrInstalled = $app.Version.Split('.')
$Response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nf3/vagrant-cent-salt/master/current_backup.txt"
$latest = $Response.Content
echo "Latest Version: $latest"
$arrLatest = $Response.Content.Split('.')
if ([int]$arrLatest[0] -gt [int]$arrInstalled[0]) { echo "Update Available" }
elseif (([int]$arrLatest[0] -eq [int]$arrInstalled[0]) -And ([int]$arrLatest[1] -gt [int]$arrInstalled[1])) { echo "Update Available" }
elseif (([int]$arrLatest[0] -eq [int]$arrInstalled[0]) -And ([int]$arrLatest[1] -eq [int]$arrInstalled[1]) -And ([int]$arrLatest[2] -gt [int]$arrInstalled[2])) { echo "Update Available" }
else { echo "Installed version is the lastest, no update available" }
