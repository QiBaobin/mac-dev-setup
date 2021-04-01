#!/usr/bin/env bash

if [ -z "$emacs_load" ]; then
    source ./brew.sh

    brew tap railwaycat/emacsmacport && brew install emacs-mac --with-modules
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

    cp -Rv ../configs/.doom.d ~/
    ~/.emacs.d/bin/doom install

    emacs_load=1
fi
