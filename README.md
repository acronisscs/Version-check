# Version-check
Script will conduct a version check of the installed Acronis SCS Agent. If agent is unavailable, it will check the latest Acronis SCS Management Server version and compare it to the latest remote version file. If no outbound connections exist, script will compare the version contained within the script.  

## Version is current
If the version is current the message will output "Installed version is the latest, no update available"

## Version is outdated
If version is outdated, message will output "Update Available"

## Version verification
### Windows
1. Navigate to the folder where "Version-check" was downloaded
2. Locate the file Update.ps1
3. Right click on Update.ps1 and select Properties
4. Select the Digital Signature tab and then select Details
5. Verify the file shows Acronis SCS, Inc as the signer and select View Certificate to verify further information

### Linux
You will need the program `gpg` installed.

1. Navigate to the folder where "Version-check" was downloaded
2. Locate the GPG public key [`gpg_public_key.asc`](./gpg_public_key.asc) and the Linux updater script [`Update.sh.asc`](./Update.sh.asc)
3. Run `gpg --import gpg_public_key.asc` and take note of its key fingerprint
4. Run `gpg --verify Update.sh.asc`. Warnings that the key is not certified with a trusted signature are expected. Just ensure that the key fingerprint matches the key imported in the previous step
5. Run `gpg --output verified_Update.sh --decrypt Update.sh.asc`
6. (Optional) Compare the contents of `verified_Update.sh` with the `Update.sh.asc` file.

The `verified_Update.sh` file will contain the signed data.

We have provided the unsigned script in [`Update.sh`](Update.sh) for your convenience.
