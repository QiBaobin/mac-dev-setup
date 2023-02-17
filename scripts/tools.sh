#!/usr/bin/env bash

if [ -z "$tools_load" ]; then

    source ./brew.sh

    brew install aspell pandoc openssl git firefox aspell
    brew install --HEAD kakoune

    cp -v ../configs/.skhdrc ../configs/.yabairc ~/
    brew install koekeishiya/formulae/yabai
    brew services start yabai

    brew install koekeishiya/formulae/skhd
    brew services start skhd

    brew install alt-tab

    tools_load=1
fi

