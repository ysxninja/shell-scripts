#!/bin/sh

configs=`echo "alacritty aliases bashrc cf fish nvim remaps starship termite ultimate-push zshrc zsh_history" | tr ' ' '\n' | sort -u`

selected=`printf "$configs\n" | fzf`

if [[ $selected == "alacritty" ]] ; then
    $EDITOR ~/.config/alacritty/alacritty.yml
elif [[ $selected == "aliases" ]] ; then
    $EDITOR ~/.oh-my-zsh/custom/aliases.zsh
elif [[ $selected == "bashrc" ]] ; then
    $EDITOR ~/.bashrc
elif [[ $selected == "cf" ]] ; then
    $EDITOR ~/.local/bin/cf
elif [[ $selected == "fish" ]] ; then
    $EDITOR ~/.config/fish/config.fish
elif [[ $selected == "nvim" ]] ; then
    $EDITOR ~/.config/nvim/init.vim
elif [[ $selected == "remaps" ]] ; then
    $EDITOR ~/.local/bin/remaps
elif [[ $selected == "starship" ]] ; then
    $EDITOR ~/.config/starship.toml
elif [[ $selected == "termite" ]] ; then
    $EDITOR ~/.config/termite/config
elif [[ $selected == "ultimate-push" ]] ; then
    $EDITOR ~/.local/bin/ultimate-push
elif [[ $selected == "zshrc" ]] ; then
    $EDITOR ~/.zshrc
elif [[ $selected == "zsh_history" ]] ; then
    $EDITOR ~/.zsh_history
fi

