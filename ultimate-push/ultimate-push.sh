#!/bin/sh

# check whether user is connected to the internet
echo "  直 Testing Connection.... "
echo "  📡 "
domain="www.github.com"
ping -c 1 -W 2 $domain > /dev/null 2>&1 && echo "  🗱  connected " || (echo "  🗶  disconnected " && echo "" && exit 4 )

status=$?
# exit if there is no connection
if test $status -eq 4
then 
    echo "  ☠  Exiting..."
    exit
else
    continue
fi

echo ""
# set path to repository you want to push
# add more repos and modify script follow repository2 commented example
repository=""
branch="main"
commit="local update"

read -p "  Enter path to repository: " repository
read -p "        branch to push (default is main): " branch
#repository2=""
echo ""
read -p "  Commit and add message? (Y/N): " confirm && ([[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] && read -p "  Commit Message:" commit && echo "" && echo "" && git -C $repository commit -a -m "$commit" && echo "" ) || echo "  Pushing only "
if [[ $repository == "" ]]
then 
    echo "  ☠  Please set the repository to push..."
    exit
else
    continue
fi

echo ""
echo " Pushing to repo\(s\)     .."

echo ""

# if you wish to set default commits uncomment below
# echo ""
# echo "Commiting updates"
git -C $repository push -u origin $branch


echo " ✅✅✅"

echo "Exiting..."
