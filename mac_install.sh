#!/bin/bash


# ____        _    __ _ _           _ 
#|  _ \  ___ | |_ / _(_) | ___  ___| |
#| | | |/ _ \| __| |_| | |/ _ \/ __| |
#| |_| | (_) | |_|  _| | |  __/\__ \_|
#|____/ \___/ \__|_| |_|_|\___||___(_)
#                                     

rm -rf ~/.*-old

for file in .*; do
    skip=0
    base=$(basename $file)
    replaces="$HOME/$base"

    # back-up existing symlinks
    if [[ -L "$replaces" ]]; then
        echo "Backing up $replaces as $replaces-old"
        cp -r "$replaces" "$replaces-old"
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
    echo "Installing $file ($repo/$file -> $replaces)"
    ln -s "$repo/$file" "$replaces"
done

echo "Done installing dotfiles"

git submodule update --init

git clone "https://github.com/gmarik/Vundle.vim.git" "$HOME/.vim/bundle/Vundle.vim"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap caskroom/cask
brew install macvim --env-std --with-override-system-vim
brew linkapps macvim

ln -s /usr/local/bin/mvim /usr/local/bin/vi
ln -s /usr/local/bin/mvim /usr/local/bin/vim

brew install python
brew install cmake
brew install node
brew linkapps
pip install --user powerline-status


npm install -g typescript gulp eslint yo

cd vim/csv.vim/ && make ; cd $CURDIR

mkdir -p ~/.tmux.d/
cp .vim/bundle/powerline/powerline/bindings/tmux/powerline.conf ~/.tmux.d/

vim +BundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer
