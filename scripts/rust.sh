#!/usr/bin/env bash
set -euo pipefail

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

export PATH="$HOME/.cargo/bin:$PATH"

# dev env
rustup component add rust-src
rustup toolchain add nightly
cargo +nightly install racer

# useful tools
cargo install bat cross du-dust fd-find lsd procs ripgrep skim starship zoxide
