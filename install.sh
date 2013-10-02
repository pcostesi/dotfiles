#!/bin/bash

	for file in .*; do
		base=$(basename $file)
        replaces="$HOME/$base"
        
        # avoid existing symlinks
        if [[ -L $replaces ]]; then
            continue;
        fi


		ln -s $file $replaces
	done
