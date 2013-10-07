#!/bin/bash

	for file in .*; do
        skip=0
		base=$(basename $file)
        replaces="$HOME/$base"
        
        # avoid existing symlinks
        if [[ -L $replaces ]]; then
            continue;
        fi
        for avoid in "." ".." ".git"; do
            if [[ $base = $avoid ]]; then
                skip=1
            fi
        done
        if [ $skip -eq 1 ]; then
            continue;
        fi
        
        repo=$(pwd)
		ln -bs "$repo/$file" "$replaces"
        echo "Installing $file"
	done
