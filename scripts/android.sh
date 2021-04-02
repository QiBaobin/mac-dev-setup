#!/usr/bin/env bash

if [ -z "$android_load" ]; then
    source ./brew.sh

    brew install kotlin openjdk
    brew install android-studio

    mkdir ~/code; cd ~/code && git clone --depth 1 https://github.com/fwcd/kotlin-language-server.git && cd -; cd ~/code/kotlin-language-server && ./gradlew :server:installDist && cd -

    android_load=1
fi
