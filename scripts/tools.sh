#!/usr/bin/env bash

if [ -z "$tools_load" ]; then

    source ./brew.sh

    brew install aspell pandoc openssl git firefox aspell tmux
    brew install --HEAD kakoune

    tools_load=1
fi

