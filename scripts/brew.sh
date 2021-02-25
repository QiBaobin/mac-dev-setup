#!/usr/bin/env bash
set -euo pipefail

cd
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

mkdir "$HOME/Applications"
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export PATH="$HOME/homebrew/bin:$PATH"
brew install tmux ispell pandoc openssl git

brew cask install alacritty firefox android-studio

cp -v ../configs/.skhdrc ../configs/.yabairc ~/
brew install koekeishiya/formulae/yabai
brew services start yabai

brew install koekeishiya/formulae/skhd
brew services start skhd

curl -L -O 'https://github.com/railwaycat/homebrew-emacsmacport/releases/download/emacs-27.1-mac-8.1/emacs-27.1-mac-8.1-10.14.6.zip' && unzip emacs*.zip && mkdir ~/Applications; mv Emacs.app ~/Applications/
