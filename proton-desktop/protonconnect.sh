#!/bin/bash

# preferred
# Pass= $(zenity --password --title="Sudo Password Required");
# echo $Pass;

if [[ $UUID == 0 ]]; then
    zenity --error --text="protonvpn not advisable to run as root!";
    echo "sudo $0 $*";
    exit 1;
fi


Status=$(protonvpn-cli status | grep "Free" -o);

if [[ $Status != '' ]]; then
	notify-send "already connecting/connected";
	exit;
fi

# edit server to your preferred location
# default is udp, can be changed below to tcp
server='US FREE#3'

if [[ $Status == '' ]]; then
	protonvpn-cli connect $server -p udp | zenity --progress --pulsate --auto-close --auto-kill;
	protonvpn-cli ks --on;
	notify-send "surF likE a sharK || killSwitch ON";
	exit;
fi

notify-send "Connection Error";

exit;

#protonvpn-cli connect
#protonvpn-cli status

#protonvpn-cli disconnect

#kill-switch commands
#protonvpn-cli ks --on
#protonvpn-cli ks --always-on
#protonvpn-cli ks --off

#protonvpn configure
