#!/bin/bash


# ____        _    __ _ _           _ 
#|  _ \  ___ | |_ / _(_) | ___  ___| |
#| | | |/ _ \| __| |_| | |/ _ \/ __| |
#| |_| | (_) | |_|  _| | |  __/\__ \_|
#|____/ \___/ \__|_| |_|_|\___||___(_)
#                                     

for file in .*; do
    skip=0
    base=$(basename $file)
    replaces="$HOME/$base"

    # back-up existing symlinks
    if [[ -L $replaces ]]; then
        cp -r $replaces $replaces-old
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

# git submodule update --init
# no longer needed

git clone "https://github.com/gmarik/Vundle.vim.git" "$HOME/.vim/bundle/Vundle.vim"

sudo apt-get install dconf-cli ipython vim git-core
sudo apt-get install ttf-inconsolata
bash gnome-terminal-colors-solarized/install.sh


CURDIR=$(pwd)
cd .vim/bundle/powerline
python setup.py install --user
cd $CURDIR

mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/
cp .vim/bundle/powerline/font/*.otf ~/.fonts/
cp .vim/bundle/powerline/font/*.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts

cd vim/csv.vim/ && make ; cd $CURDIR

mkdir -p ~/.solarized/dircolors
cp dircolors-solarized/dircolors.ansi-dark ~/.solarized/dircolors/

mkdir -p ~/.tmux.d/
cp .vim/bundle/powerline/powerline/bindings/tmux/powerline.conf ~/.tmux.d/

vim +BundleInstall +qall
