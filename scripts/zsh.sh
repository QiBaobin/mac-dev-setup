#!/usr/bin/env bash
set -euo pipefail

cp -Rv ../configs/.* ~/

mkdir ~/.zsh
curl -L -o ~/.zsh/skim.zsh https://raw.githubusercontent.com/lotabout/skim/master/shell/key-bindings.zsh

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
