#!/usr/bin/env bash

if [ -z "$brew_laod" ]; then


    cd
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
    cd -

    mkdir "$HOME/Applications"
    export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
    export PATH="$HOME/homebrew/bin:$PATH"

    brew_laod=1
fi

