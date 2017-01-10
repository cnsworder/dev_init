#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com


set -e

if which brew; then
    brew install cask
elif [ ! -d ~/.cask ]; then
    git clone https://github.com/cask/cask.git ~/.cask
fi

if [ ! -d ~/.emacs.d ]; then
    ln -s `pwd`/emacs.d ~/.emacs.d
fi

cd ~/.emacs.d
cask install
echo "Cask installed package..."
