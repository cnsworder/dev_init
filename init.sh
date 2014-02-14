#!/usr/bin/env bash

if [ -x /usr/bin/pacman ];then
    PM=${PM:=pacman}
    PM_INSTALL=-S
    OS=arch
elif [ -x /usr/bin/apt-get ];then
    PM=apt-get
    PM_INSTALL=install
    OS=debian
elif [ -x /usr/bin/yum ]; then
    PM=yum
    PM_INSTALL=install
    OS=redhat
elif [ -x /usr/bin/emerge ]; then
    PM=emerge
    PM_INSTALL=
    OS=redhat
fi

echo "OS: $OS"
echo "using Package Manager $PM"

echo "Installing packages..."

PACKAGES=vim emacs tmux python ctags cscope curl aria2 zsh

yes | ${PM} ${PM_INSTALL} ${PACKAGES}

echo "Configing environment..."

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh `which zsh`
#if [[ `id -u` == 0 ]]; then
#    echo "export EDITOR=vim" >> /etc/profile
#fi

ln -s ./crossword/emacs ~/.emacs 
ln -s ./crossword/vimrc ~/.vimrc

read endf -p "Init finish..."
