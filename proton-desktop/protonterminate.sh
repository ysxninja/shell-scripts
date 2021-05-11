#!/bin/bash

Status=$(protonvpn-cli status | grep "Free" -o);

if [[ $Status != '' ]]; then
	zenity --warning --width="200" --text="You are about to disconnect \n\nKill Switch Remains Active";
	protonvpn-cli disconnect;
	protonvpn-cli ks --off;
	notify-send "disconnected || killSwitch OFF";
	exit;
fi

notify-send "already disconnected";

exit;
