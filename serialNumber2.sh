#!/bin/bash

Pass=$(zenity --password --title=Sudo\ Password\ Required);

echo $Pass | sudo -S whoami;
if [[ $(sudo -S whoami) == 'root' ]]; then
	sudo -S dmidecode -t system | grep Serial | zenity --text-info;
	exit;
fi

zenity --error --text="Wrong Sudo Password"

exit;
