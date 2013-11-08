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

git submodule update --init

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

sudo apt-get install dconf-cli ipython vim git-core
sudo apt-get install ttf-inconsolata
bash gnome-terminal-colors-solarized/install.sh

mkdir -p ~/.fonts ~/.fonts.conf.d
cp .vim/bundle/powerline/font/*.otf ~/.fonts/
cp .vim/bundle/powerline/font/*.conf ~/.fonts.conf.d/
fc-cache -vf ~/.fonts

cd vim/csv.vim/make && make ; cd -
