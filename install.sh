#!/bin/bash

for file in .*; do
    skip=0
    base=$(basename $file)
    replaces="$HOME/$base"

    # back-up existing symlinks
    if [[ -L $replaces ]]; then
        cp $replaces $replaces-old
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

sudo apt-get install dconf-cli ipython vim git-core
sudo apt-get install ttf-inconsolata
bash gnome-terminal-colors-solarized/install.sh

python .vim/bundle/powerline/setup.py install --user

mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/
cp .vim/bundle/powerline/font/*.otf ~/.fonts/
cp .vim/bundle/powerline/font/*.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts

cd vim/csv.vim/ && make ; cd -

mkdir -p ~/.solarized/dircolors
cp dircolors-solarized/dircolors.256dark ~/.solarized/dircolors/

mkdir -p ~/.tmux.d/
cp .vim/bundle/powerline/powerline/bindings/tmux/powerline.conf ~/.tmux.d/
