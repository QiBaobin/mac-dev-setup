#!/usr/bin/env bash
set -euo pipefail

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

cp -Rv ../configs/.doom.d ~/
