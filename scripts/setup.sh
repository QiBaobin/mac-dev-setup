#!/usr/bin/env bash
set -euo pipefail

dir=$(dirname $0)
for entry in "$dir"/*
do
    if [[ $entry != $0 ]]; then
	bash "$entry"
    fi
done

