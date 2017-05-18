#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com


set -e

if which brew; then
    brew install cask
elif [ ! -d ~/.cask ]; then
	curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
fi

if [ ! -d ~/.emacs.d ]; then
    ln -s `pwd`/emacs.d ~/.emacs.d
fi

cd ~/.emacs.d
cask install
echo "Cask installed package..."
