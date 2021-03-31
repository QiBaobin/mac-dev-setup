#!/usr/bin/env bash
set -euo pipefail

if [ -z "$tools_load" ];
    source ./brew.sh

    brew install tmux ispell pandoc openssl git

    brew cask install alacritty firefox

    cp -v ../configs/.skhdrc ../configs/.yabairc ~/
    brew install koekeishiya/formulae/yabai
    brew services start yabai

    brew install koekeishiya/formulae/skhd
    brew services start skhd

    brew install alt-tab

    tools_load=1
fi
