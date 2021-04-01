#!/usr/bin/env bash

if [ -z "$nvim_load" ]; then

    source ./brew.sh

    brew install neovim --HEAD

    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    mkdir -p ~/.config/nvim; cp -v ../config/init.vim ~/.config/nvim/

    nvim_load=1
fi

