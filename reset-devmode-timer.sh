#!/bin/sh

SSH_KEYFILE="/root/.ssh/tv_webos"
TV_HOST="192.168.4.104"

sessionToken=$(ssh -i ${SSH_KEYFILE} -p 9922 prisoner@${TV_HOST} cat /var/luna/preferences/devmode_enabled)

checkSession=$(curl --max-time 3 -s "https://developer.lge.com/secure/ResetDevModeSession.dev?sessionToken=${sessionToken}")
