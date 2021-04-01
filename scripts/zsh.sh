#!/usr/bin/env bash

if [ -z "$brew_load" ]; then


    source ./brew.sh
    brew insall zsh
    cp -Rv ../configs/.* ~/

    mkdir ~/.zsh
    curl -L -o ~/.zsh/skim.zsh https://raw.githubusercontent.com/lotabout/skim/master/shell/key-bindings.zsh

    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

    brew_load=1

fi

