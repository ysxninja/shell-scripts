#!/bin/sh


printf "\n\e[1;36m直\e[0m Testing Connection.... "
printf "\n\e[1;36m📡 \e[0m"
ping -c 1 -W 2 google.com > /dev/null 2>&1 && printf "\n\e[1;32m🗱  \e[0m connected " || (printf "\n\e[1;31m🗶 \e[0m disconnected \n" && exit 4 )

status=$?

if test $status -eq 4
then 
    printf "\n\e[0;31m☠  Exiting...\e[0m\n"
    exit
else
    continue
fi

printf "\n"

repository=""
branch="main"
commit="local update"

printf "\n"
read -p "Enter path to repository: " repository
printf "\n"
read -p "  Branch to push (default is main): " branch

printf "\n"
read -p "  Commit and add message? (Y/N): " confirm && ([[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] && printf "\n" && read -p "  Commit Message:" commit && printf "\n    Message: $commit" && printf "\n\n" && git -C $repository commit -a -m "$commit" && printf "\n" ) || printf "\n  Pushing only \n"
if [[ $repository == "" ]]
then 
    printf "\n☠  Please set the repository to push...\n"
    exit
else
    continue
fi

printf "\n\e[1;36m\e[0m Pushing to repo \e[1;36m    ..\e[0m\n"

printf "\n"
git -C $repository push -u origin $branch

printf " \n\n\e[1;33m✅✅✅\e[0m\n"

