#!/usr/bin/env bash

if [ -z "$rust_load" ]; then

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    export PATH="$HOME/.cargo/bin:$PATH"

    # dev env
    rustup component add rust-src
    rustup component add clippy
    rustup component add rust-analyzer

    # useful tools
    cargo install quickinstall
    carog quickinstall bat fd-find eza ripgrep skim starship zoxide xh cargo-update just git-absort topgrade pueue git-delta sd viu atuin yazi-fm yazi-cli

    rust_load=1
fi

