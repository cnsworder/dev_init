#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com

set -e

if which stow &> /dev/null; then
    stow . -t ${HOME}
else
    if [ ! -d ~/.emacs.d ]; then
        ln -s `pwd`/emacs.d ~/.emacs.d
    fi
fi
