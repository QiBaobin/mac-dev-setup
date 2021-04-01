#!/usr/bin/env bash

if [ -z "$term_load" ]; then

    source ./brew.sh

    brew tap wez/wezterm && brew install wezterm

    mkdir -p ~/.config/wezterm.lua; cp -v ../config/wezterm.vim ~/.config/wezterm/

    term_load=1
fi

