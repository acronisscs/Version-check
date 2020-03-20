#!/bin/sh

local_server_version=$(rpm -qa AcronisCentralizedManagementServer)
local_agent_version=$(rpm -qa BackupAndRecoveryAgent)
filtered_server_string=${local_server_version:35:-9}
filtered_agent_string=${local_agent_version:23:-9}
current_version_remote=$(timeout 2 wget -qO- https://raw.githubusercontent.com/acronisscs/Version-check/master/Version_Number.txt)
current_version_local="12.5.15961"

IFS='.'

read -ra verInstalled <<< "$filtered_agent_string"

if [ -z "$filtered_agent_string" ]; then
   read -ra verInstalled <<< "$filtered_server_string"
fi

read -ra verLatest <<< "$current_version_remote"

if [ -z "$current_version_remote" ]; then
   read -ra verLatest <<< "$current_version_local"
fi

if [ "${verInstalled[0]}" != "${verLatest[0]}" ]; then
    echo "Update Available"
elif [ "${verInstalled[0]}" != "${verLatest[0]}" ] || [ "${verInstalled[1]}" != "${verLatest[1]}" ]; then
    echo "Update Available"
elif [ "${verInstalled[0]}" != "${verLatest[0]}" ] || [ "${verInstalled[1]}" != "${verLatest[1]}" ] || [ "${verInstalled[2]}" != "${verLatest[2]}" ]; then
    if [ "${verInstalled[0]}" -gt "${verLatest[0]}" ] || [ "${verInstalled[1]}" -gt "${verLatest[1]}" ] || [ "${verInstalled[2]}" -gt "${verLatest[2]}" ]; then
        echo "Local version is more up to date than the remote version, no update needed."
    else
        echo "Update Available"
    fi
else
    echo "Installed version is the lastest, no update available"
fi
