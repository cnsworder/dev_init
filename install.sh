#!/usr/bin/env bash

if which stow &> /dev/null; then
    stow . -t ${HOME}
else
    ln -s .zshrc ~/.zshrc
    ln -s .zshenv ~/.zshenv
    ln -s .tmux.conf ~/.tmux.conf
fi
