#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com


set -e

function install_cask() {
    if [ ! -d ~/.cask ]; then
        curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
    fi
}

if !which cask &> /dev/null; then
    install_cask
fi

if which stow &> /dev/null; then
    stow . -t ${HOME}
else
    if [ ! -d ~/.emacs.d ]; then
        ln -s `pwd`/emacs.d ~/.emacs.d
    fi
fi

cd ~/.emacs.d
cask install
echo "Cask installed package..."
