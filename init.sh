#!/usr/bin/env bash

OS=$(cat /etc/issue)
if [ "$OS" == "archlinu" ];then
    PM=${PM:=pacman}
    PM_INSTALL=-S
else if [ "$OS" == "debian" || "$OS" == "redhat" ];then
    PM=apt-get
    PM_INSTALL=install
fi

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh `which zsh`
#if [[ `id -u` == 0 ]]; then
#    echo "export EDITOR=vim" >> /etc/profile
#fi

ln -s ./crossword/emacs ~/.emacs 
ln -s ./crossword/vimrc ~/.vimrc

${PM} ${PM_INSTALL}  
