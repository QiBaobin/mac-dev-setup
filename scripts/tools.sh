#!/usr/bin/env bash

if [ -z "$tools_load" ]; then

    source ./brew.sh

    brew install aspell pandoc openssl git firefox aspell
    brew install --HEAD kakoune
    brew install --HEAD wezterm

    tools_load=1
fi

