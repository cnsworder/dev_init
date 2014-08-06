#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com
# date: 2014-02-14
# version: 1.1

PACKAGES="vim emacs tmux python ctags cscope curl aria2 zsh"
MANAGES="fabric salt-master"
XPACKAGES=gvim
PIP=pip
PYTHON_PACKAGES=virtualenv

INIT_VIM=false
INIT_EMACS=false
INIT_PACKAGE=false
INIT_XPACKAGE=false
INIT_PYTHON=false

THIS_PATH=$(realpath .)

IS_ROOT=$(id -u)

function init_package() {
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

    if [[ "${IS_ROOT}" != "0" ]]; then
        return
    fi
    yes | ${PM} ${PM_INSTALL} ${PACKAGES}

}

function init_xpackage() {
    if [[ $# == 1 ]]; then
       if [[ "$1" == "gui" ]]; then 
          echo "Install X Appliaction..."
          yes | ${PM} ${PM_INSTALL} ${XPACKAGES}
       fi
    fi
}

function init_vim() {
    echo "Configing vim..."
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
    ln -s ${THIS_PATH}/vimrc ~/.vimrc
    #if [[ `id -u` == 0 ]]; then
    #    echo "export EDITOR=vim" >> /etc/profile
    #fi
}

function init_shell() {
    echo "Configing Shell, set zsh to default shell..."
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh `which zsh`
}

function init_emacs() {
    echo "Configing emacs..."
    MAJOR=emacs --version | head -1 | awk '{print $3}' | awk -F. '{print $1}'
    
    if (( ${MAJOR} < 24 )); then
       echo "emacs version < 24, will install elpa..."
       git clone https://github.com/technomancy/package.el elpa
    fi
    
    ln -s ${THIS_PATH}/emacs ~/.emacs
}


function init_python() {
    # python
    echo "Update python environment..."

    if [ ! -d ~/.pip ]; then
        mkdir ~/.pip
    elif [ -e ~/.pip/pip.conf ]; then
        mv ~/.pip/pip.conf ~/.pip/pip.conf.old  
    fi

    ln -s ${THIS_PATH}/pip.conf ~/.pip/pip.conf

    if [[ "${IS_ROOT}" != "0" ]]; then
        return
    fi
    ${PIP} install ${PYTHON_PACKAGES}
}

function proc() {
    echo "Begin Configure..."

    if [ ${INIT_VIM} == "true" ]; then
        init_vim
    fi
    
    if [ ${INIT_EMACS} == "true" ]; then
        init_emacs
    fi

    if [ ${INIT_PACKAGE} == "true" ]; then
        init_package
    fi

    if [ ${INIT_XPACKAGE} == "true" ]; then
        init_xpackage
    fi

    if [ ${INIT_PYTHON} == "true" ]; then
        init_python
    fi

    if [ ${INIT_SHELL} == "true" ]; then
        init_shell
    fi

    echo "Init finish..."
}


function main() {
    echo "#####################################"
    proc
    echo "#####################################"
}

while getopts "vepkxa" arg
do
   case ${arg} in
      v)
          INIT_VIM=true
          ;;
      e)
          INIT_EMACS=true
          ;;
      p)
          INIT_PYTHON=true
          ;;
      k)
          INIT_PACKAGE=true
          ;;
      x)
          INIT_XPACKAGE=true
          ;;
      s)
          INIT_SHELL=true
          ;;
      a)
          echo "all will configure..."

          INIT_VIM=true
          INIT_EMACS=true
          INIT_PYTHON=true
          INIT_PACKAGE=true
          INIT_XPACKAGE=true
          INIT_SHELL=false
         ;;
      ?)
         echo "Unkow option..."
         exit -1
         ;;
    esac
done

main
