#!/usr/bin/env bash
set -euo pipefail

if [ -z "$android_load" ];
    source ./brew.sh

    brew install kotlin
    brew cask install android-studio

    android_load=1
fi
