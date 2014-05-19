#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com
# date: 2014-02-14
# version: 1.1

PACKAGES=vim emacs tmux python ctags cscope curl aria2 zsh
XPACKAGES=gvim
PIP=pip
PYTHON_PACKAGES=virtualenv

if [ -x /usr/bin/pacman ];then
    PM=${PM:=pacman}
    PM_INSTALL=-S
    OS=arch
    yes | pacman -Syu
elif [ -x /usr/bin/apt-get ];then
    PM=apt-get
    PM_INSTALL=install
    OS=debian
    yes | apt-get update; apt-get upgrade
elif [ -x /usr/bin/yum ]; then
    PM=yum
    PM_INSTALL=install
    OS=redhat
    yes | yum update
elif [ -x /usr/bin/emerge ]; then
    PM=emerge
    PM_INSTALL=
    OS=gentoo
    emerge world
fi

echo "OS: $OS"
echo "Package Manager: $PM"

echo "Installing packages..."

yes | ${PM} ${PM_INSTALL} ${PACKAGES}

echo "Configing environment..."

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh `which zsh`
#if [[ `id -u` == 0 ]]; then
#    echo "export EDITOR=vim" >> /etc/profile
#fi

ln -s ./emacs ~/.emacs 
ln -s ./vimrc ~/.vimrc


# python
echo "Update python environment..."

if [ ! -d ~/.pip ]; then
    mkdir ~/.pip
elif [ -e ~/.pip/pip.conf ]; then
    mv ~/.pip/pip.conf ~/.pip/pip.conf.old  
fi

ln -s ./pip.conf ~/.pip/pip.conf

${PIP} install ${PYTHON_PACKAGES}

if [[ $# == 1 ]]; then
   if [[ "$1" = "gui" ]]; then 
      echo "Install X Appliaction..."
      yes | ${PM} ${PM_INSTALL} ${XPACKAGES}
   fi
fi

read endf -p "Init finish..."
