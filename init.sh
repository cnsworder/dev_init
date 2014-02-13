#!/usr/bin/env bash

if [ -x /usr/bin/pacman ];then
    PM=${PM:=pacman}
    PM_INSTALL=-S
    OS=arch
else if [ -x /usr/bin/apt-get ];then
    PM=apt-get
    PM_INSTALL=install
    OS=debian
else if [ -x /usr/bin/rpm ]; then
    PM=rpm
    PM_INSTALL=install
    OS=redhat
fi

echo "OS: $OS"
echo "using Package Manager $PM"

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
