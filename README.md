# Version-check
Script will conduct a version check of the installed Acronis SCS Agent. If agent is unavailable, it will check the latest Acronis SCS Management Server version and compare it to the latest remote version file. If no outbound connections exist, script will compare the version contained within the script.  

## Version is current
If the version is current the mesage will ouput "Installed version is the lastest, no update available"

## Version is outdated
If version is outdated, message will output "Update Available" 

## Version verification
### Windows
1. Navigate to the folder where "Version-check" was downloaded
2. Locate the file Update.ps1
3. Right click on Update.ps1 and select Properties
4. Select the Digital Signature tab and then select Details
5. Verify the file shows Acrosnis SCS, Inc as the signer and select View Certificate to verify furhter information

