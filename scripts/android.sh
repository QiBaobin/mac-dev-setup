#!/usr/bin/env bash

if [ -z "$android_load" ]; then
    source ./brew.sh

    brew install kotlin
    brew install android-studio

    android_load=1
fi
