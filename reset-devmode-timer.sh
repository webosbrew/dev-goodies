#!/bin/sh

sessionToken=$(ssh -i tv_webos -p 9922 prisoner@192.168.4.104 cat /var/luna/preferences/devmode_enabled)

checkSession=$(curl --max-time 3 -s "https://developer.lge.com/secure/ResetDevModeSession.dev?sessionToken=${sessionToken}")
