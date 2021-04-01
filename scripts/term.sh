#!/usr/bin/env bash
set -euo pipefail

if [ -z "$term_load" ];
    source ./brew.sh

    brew tap wez/wezterm && brew install wezterm

    mkdir -p ~/.config/wezterm.lua; cp -v ../config/wezterm.vim ~/.config/wezterm/

    term_load=1
fi
