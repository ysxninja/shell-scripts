#!/bin/bash
Status=$(protonvpn-cli status | grep "Free" -o);

#gnome-terminal --window-with-profile=mForHoldTerminal -e "protonvpn-cli status"
if [[ $Status == '' ]];then
	zenity --error --text="No connection established yet" --title="Disconnected";
	exit
fi

protonvpn-cli status | zenity --text-info;

exit;
