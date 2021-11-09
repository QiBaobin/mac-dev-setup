#!/usr/bin/env bash

if [ -z "$helix_load" ]; then
    mkdir ~/code; git clone --recurse-submodules --shallow-submodules -j8 https://github.com/helix-editor/helix ~/code/helix && cargo install --path ~/code/helix/helix-term
    mkdir ~/.config/helix; ln -sf ~/code/helix/runtime ~/.config/helix/

    helix_load=1
fi
