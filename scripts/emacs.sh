#!/usr/bin/env bash
set -euo pipefail

export PATH="$HOME/homebrew/bin:$PATH"

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

cp -Rv ../configs/.doom.d ~/
~/.emacs.d/bin/doom install
