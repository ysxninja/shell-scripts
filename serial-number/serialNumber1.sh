#!/bin/bash

# uncomment to use in bash if no hold terminal option can be set
#PASSWD="$(zenity --password --title=Sudo\ Password\ Required)"
#notify-send "Successful"
#bash -c 'echo -e $PASSWD | sudo -S dmidecode -t system | grep Serial | zenity --text-info'

# comment below commands if above is uncommented


# change gnome-terminal to default terminal, e.g termite, termux etc
# you can use the --window-with-profile=mForNOTHoldTerminal, 
# where mForNOTHoldTerminal is a profile in gnome that holds the 
# terminal when the command exits (preferences> command> when command exits> option 3?)

#comment below if terminal does not hold and uncomment the first commands above
gnome-terminal -e "bash -c 'echo \"Serial Number From System Using Dmidecode\" && echo && sudo echo && sudo dmidecode -t system | grep Serial | zenity --text-info' "

#gnome-terminal --window-with-profile=mForHoldTerminal -e "bash -c 'echo \"Serial Number From System Using Dmidecode\" && echo \"Enter Password\" && sudo echo && sudo dmidecode -t system | grep Serial | zenity --text-info && exit' "

exit;
