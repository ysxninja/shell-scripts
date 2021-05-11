#!/bin/bash

# example path statusK=~/Desktop/kill-switch/.statusKillSwitch

# statusK=`path-here`/kill-switch/.statusKillSwitch
statusKillSwitch=$(cat statusK);

#toggle switch
if [ $(echo $statusKillSwitch) == "OFF" ]; then
	echo "here >>>";
	protonvpn-cli ks --always-on && notify-send " kill-switch ON " && echo "ON" > statusK;
else
	protonvpn-cli ks --off && notify-send " kill-switch OFF " && echo "OFF" > statusK;
	echo $statusKillSwitch;
fi

exit;
