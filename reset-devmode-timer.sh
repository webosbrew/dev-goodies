#!/bin/sh

SSH_KEYFILE="/root/.ssh/tv_webos"
TV_HOST="192.168.4.104"

sessionToken=$(ssh -i ${SSH_KEYFILE} -o ConnectTimeout=3 -p 9922 prisoner@${TV_HOST} cat /var/luna/preferences/devmode_enabled)
if [ -z "${sessionToken}" ]; then
  sessionToken=$(cat /tmp/webos_devmode_token.txt)
else
  echo ${sessionToken} > /tmp/webos_devmode_token.txt
fi

if [ -z "${sessionToken}" ]; then
  echo "Unable to get token" >&2
  exit 1
fi

checkSession=$(curl --max-time 3 -s "https://developer.lge.com/secure/ResetDevModeSession.dev?sessionToken=${sessionToken}")

echo $checkSession
