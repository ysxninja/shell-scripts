#!/usr/bin/env bash
# set -x;
declare -A systemInfo;
hostname=$(hostname)
termSize=( $(stty size) )
process_watcher=0;

_terminator(){
  echo -ne "\r\r"
  echo -ne "\u274C"
}
_help(){
  echo -e " \033[1;34m You must run the command as sudo or root use sudo \n sudo $0 or login as root\033[m"
}
_check_perm(){
    if [[ ${EUID} -ne 0 ]]; then
      _help && exit 244;
    fi
}
_populate_system(){
  systemInfo["Ram Type"]="$(dmidecode -t memory | awk '/Type/ {i++}i==2 { print $2;}')"
  systemInfo["Ram Size"]=$(dmidecode -t memory | awk 'BEGIN{slot=0;}/Size/ { slot+=1;printf "slot" slot" " $2$3" "}')
  systemInfo["Ram Speed"]=$(dmidecode -t memory | awk 'BEGIN{slot=0;}$1 ~ /^Speed/ { slot+=1;printf "slot" slot" " $2 $3 " " }')
  systemInfo["Maximum Supported Ram"]=$(dmidecode -t memory | awk '/Maximum Capacity/ { print $3$4;}')
  systemInfo["Manufacturer"]=$(dmidecode --string=baseboard-manufacturer)
  systemInfo["Processor"]="$(dmidecode --string=processor-manufacturer) $(dmidecode --string=processor-family) $(dmidecode -t processor | awk '/Current Speed/ { print $3$4;}') - $(dmidecode -t processor | awk '/Max Speed/ { print $3$4;}')"
  systemInfo["No of Cores"]="$(dmidecode -t processor | awk '/Core Count/ { print $3;}') cores"
  systemInfo["Serial Number"]=$(dmidecode --string=system-serial-number)
  systemInfo["Product Name"]=$(dmidecode --string=system-product-name)
  systemInfo["Rom Size"]=$(dmidecode -t bios | awk '/ROM/ { print $3 $4 }')
  systemInfo["OS Architecture"]=$(uname --machine)
  systemInfo["OS Name"]="$(uname --operating-system) - $(lsb_release -c | awk '{ print $2}')"
}

_(){
    _check_perm
    clear && _populate_system
    compname="Computer name - "
    text_length=$(( ${#compname} + ${#hostname} ))
    for (( i = 0; i < $(( $(( ${termSize[1]} - $text_length  )) / 2 )); i++ )); do
      echo -ne " "
    done
    echo -e "\033[1;34mSystem Information - $hostname\033[m"
    echo ""
    echo -ne "  " && for (( i = 0; i < ${termSize[1]}-4; i++ )); do
      echo -ne "\033[1;36m-\033[m"
    done
    echo ""

    for key in "${!systemInfo[@]}";do
      to_use=$(( ${termSize[1]} - 6 ))
      total=$(( ${to_use} - $(( ${#systemInfo[$key]} + ${#key} )) ))
      echo -ne "  \033[1;34m$key\033[m "
      for (( i = 0; i < ${total}; i++ )); do
        echo -ne "\u2197" && sleep .001;
        # \u25B8
      done
      sleep .002
        echo -ne " \033[1;33m${systemInfo[$key]}\033[m"
        echo -e "\n"
    done


    _auth0r="@\u1CE1Morph 💀\u2020\u2122"
    
    text_length=${#_auth0r}
    for (( i = 0; i < $(( $(( ${termSize[1]} - $text_length  )) / 2 )); i++ )); do
      echo -ne " "
    done
    echo -e "\033[1;31mAuthor $_auth0r\033[m\n\n"
}
# ignore kill attempts
# trap _terminator SIGINT
trap "" SIGINT

# start entry point of bourne script
_
