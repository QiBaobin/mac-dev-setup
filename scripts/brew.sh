#!/usr/bin/env bash
set -euo pipefail

cd
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

mkdir "$HOME/Applications"
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export PATH="$HOME/homebrew/bin:$PATH"
brew install tmux ispell pandoc openssl git emacs

brew cask install amethyst alacritty firefox android-studio
