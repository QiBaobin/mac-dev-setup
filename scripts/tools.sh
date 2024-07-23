#!/usr/bin/env bash

if [ -z "$tools_load" ]; then

    source ./brew.sh

    brew install aspell openssl git tmux fzf gawk jq
    brew install --HEAD kakoune
    brew install --cask wezterm
    brew install --cask amethyst && cp ../configs/.amethyst.yml ~/

    tools_load=1
fi

