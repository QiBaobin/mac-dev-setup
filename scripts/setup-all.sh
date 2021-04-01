#!/usr/bin/env bash

dir=$(dirname $0)
for entry in "$dir"/*.sh
do
    if [[ $entry != $0 ]]; then
	source "$entry"
    fi
done

