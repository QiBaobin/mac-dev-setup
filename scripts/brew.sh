#!/usr/bin/env bash
set -euo pipefail

if [ -z "$brew_laod" ];

    cd
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

    mkdir "$HOME/Applications"
    export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
    export PATH="$HOME/homebrew/bin:$PATH"

    brew_laod=1
fi
