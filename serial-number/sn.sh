#!/bin/sh

bash -c 'echo Serial Number From System Using Dmidecode && echo && sudo dmidecode -t system | grep Serial'

# bash -c 'echo \"Serial Number From System Using Dmidecode\" && echo && sudo echo && sudo dmidecode -t system | grep Serial | zenity --text-info' 

