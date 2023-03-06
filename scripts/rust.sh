#!/usr/bin/env bash

if [ -z "$rust_load" ]; then

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    export PATH="$HOME/.cargo/bin:$PATH"

    # dev env
    rustup component add rust-src
    rustup component add clippy
    rustup component add rust-analyzer

    # useful tools
    cargo install bat cross fd-find exa ripgrep skim starship zoxide xh cargo-update just git-absort topgrade zellij git-delta ruplacer

    rust_load=1
fi

