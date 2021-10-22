#!/bin/sh

printf "\n\e[1;36m直\e[0m Testing Connection.... "
printf "\n\e[1;36m📡 \e[0m"
ping -c 1 -W 2 google.com > /dev/null 2>&1 && printf "\n\e[1;32m🗱 \e[0m connected " || (printf "\n\e[1;31m🗶 \e[0m disconnected \n" && exit 4 )

status=$?
statusbranch=$(git branch --show-current > /dev/null 2>&1 && printf 0 || printf 1)

if test $status -eq 4
then 
    printf "\n\e[0;31m☠  Exiting...\e[0m\n"
    exit
else
    continue
fi
if test $statusbranch -eq 1
then
    printf "\n\nFatal not a git repository\n"
    exit
else
    continue
fi

printf "\n\n"

branch=$(git branch --show-current)

printf "Fetching origin for branch \e[1;33m$branch\e[0m "
git -C . fetch origin
printf "\e[1;33m✅✅✅\e[0m\n"

read -p "  Show diff/patch (d/p): " confirm && ([[ $confirm == [dD] || $confirm == [dD][iI][fF][fF] ]] && printf "\n" && printf "Showing diff for \e[1;33m$branch\e[0m\n" && git diff HEAD...origin/$branch )  || ([[ $confirm == [pP] || $confirm == [pP][aA][tT][cC][hH] ]] && printf "\n" && printf "Showing patch for \e[1;33m$branch\e[0m\n" && git log -p HEAD..origin/$branch ) || exit

read -p "  merge/rebase/pull (m/r/p) " confirmpull && ([[ $confirmpull == [mM] || $confirm == [mM][eE][rR][gG][eE] ]] && printf "\n" && git merge origin/$branch ) || ([[ $confirmpull == [rR] || $confirm == [rR][eE][bB][aA][sS][eE] ]] && printf "\n" && git pull --rebase origin $branch ) || ([[ $confirmpull == [pP] || $confirm == [pP][uU][lL][lL] ]] && printf "\n" && git pull )

printf "\n"
