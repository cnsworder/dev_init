#!/usr/bin/env bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh `which zsh`
#if [[ `id -u` == 0 ]]; then
#    echo "export EDITOR=vim" >> /etc/profile
#fi

ln -s ./crossword/emacs ~/.emacs 
ln -s ./crossword/vimrc ~/.vimrc
