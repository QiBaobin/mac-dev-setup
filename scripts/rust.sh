#!/usr/bin/env bash

if [ -z "$rust_load" ]; then

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    export PATH="$HOME/.cargo/bin:$PATH"

    # dev env
    rustup component add rust-src

    # useful tools
    cargo install bat cross du-dust fd-find lsd procs ripgrep skim starship zoxide

    owd=$PWD
    mkdir ~/code; cd ~/code && git clone --depth 1 https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer && cargo xtask install --server
    cd $owd
    rust_load=1
fi

