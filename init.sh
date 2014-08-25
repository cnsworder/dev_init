#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com
# date: 2014-02-14
# version: 1.1

PACKAGES="vim emacs tmux python ctags cscope curl aria2 tig ranger"
DEV_PACKAGES="gcc-c++ clang"
MANAGES="fabric salt-master"
XPACKAGES="gvim"
PIP="pip"
PYTHON_PACKAGES="virtualenv"

INIT_VIM=false
INIT_EMACS=false
INIT_PACKAGE=false
INIT_XPACKAGE=false
INIT_PYTHON=false

function pre_package() {

    if [ -x /usr/bin/pacman ];then
        PM=${PM:=pacman}
        PM_INSTALL=-S
        OS=arch
        PM_UPDATE=-Syu
    elif [ -x /usr/bin/apt-get ];then
        PM=apt-get
        PM_INSTALL=install
        PM_UPDATE=upgrade
        OS=debian
        yes | apt-get update
    elif [ -x /usr/bin/yum ]; then
        PM=yum
        PM_INSTALL=install
        PM_UPDATE=update
        OS=redhat
    elif [ -x /usr/bin/emerge ]; then
        PM=emerge
        PM_INSTALL=
        PM_UPDATE=world
        OS=gentoo
    fi

    echo "OS: $OS"
    echo "Package Manager: $PM"
}

function update_package() {
    yes | ${PM} ${PM_UPDATE}
}

pre_package

if ! which realpath > /dev/null ; then
   echo "${PM} ${PM_INSTALL} realpath"
   yes | ${PM} ${PM_INSTALL} realpath 
fi

THIS_PATH=$(realpath .)

IS_ROOT=$(id -u)


function init_package() {
    
    echo "Installing packages..."

    if [[ "${IS_ROOT}" != "0" ]]; then
        return
    fi

    update_package

    yes | ${PM} ${PM_INSTALL} ${PACKAGES}

}

function init_dev() {

    if [[ "${IS_ROOT}" != "0" ]]; then
        return
    fi

    update_package

    yes | ${PM} ${PM_INSTALL} ${DEV_PACKAGES}
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

    if ! which vim > /dev/null; then
        if [[ "${IS_ROOT}" != "0" ]]; then
            return
        fi
        yes | ${PM} ${PM_INSTALL} vim
    fi
    
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
    
    ln -s ${THIS_PATH}/vimrc ~/.vimrc
    sed -i "s/\(colorscheme molokai\)/\"\1/g" vimrc
    vim +PluginInstall +qall
    sed -i "s/\"\(colorscheme molokai\)/\1/g" vimrc
    
    #if [[ `id -u` == 0 ]]; then
    #    echo "export EDITOR=vim" >> /etc/profile
    #fi
}

function init_emacs() {
    echo "Configing emacs..."
    if ! which emacs > /dev/null; then
        if [[ "${IS_ROOT}" != "0" ]]; then
            return
        fi
        yes | ${PM} ${PM_INSTALL} emacs
    fi
    MAJOR=$(emacs --version | head -1 | awk '{print $3}' | awk -F. '{print $1}')
    
    if (( ${MAJOR} < 24 )); then
       echo "emacs version < 24, will install elpa..."
       git clone https://github.com/technomancy/package.el elpa
       #TODO: 经常出错emacs 24以下版本暂时不支持了
       return
    fi
    
    ln -s ${THIS_PATH}/emacs ~/.emacs

    emacs -nw -f cn-set-package 
}


function init_python() {
    # python
    echo "Update python environment..."

    if ! which ${PIP} > /dev/null; then
        if [[ "${IS_ROOT}" != "0" ]]; then
            return
        fi
        yes | ${PM} ${PM_INSTALL} python-${PIP}
    fi

    if [ ! -d ~/.pip ]; then
        mkdir ~/.pip
    elif [ -e ~/.pip/pip.conf ]; then
        mv ~/.pip/pip.conf ~/.pip/pip.conf.old  
    fi

    if [[ "${IS_ROOT}" != "0" ]]; then
        return
    fi
    
    ln -s ${THIS_PATH}/pip.conf ~/.pip/pip.conf


    ${PIP} install ${PYTHON_PACKAGES}
}

function init_shell() {
    echo "Configing Shell, set zsh to default shell..."
    
    if ! which zsh > /dev/null; then
        if [[ "${IS_ROOT}" != "0" ]]; then
            return
        fi
        yes | ${PM} ${PM_INSTALL} zsh
    fi
    
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh `which zsh`
}

function init_sshd() {
   echo "Configure ssh server..."

   if [[ "${IS_ROOT}" != "0" ]]; then
       return
   fi

cat << EOF >> /etc/ssh/sshd_conf
UseDNS no
GatewayPorts yes
TCPKeepAlive yes
ClientAliveInterval 60
ClientAliveCountMax 99999
EOF

    systemctl restart sshd || service ssh restart
}

function init_ssh() {
    echo "Configure ssh ..."
    
    echo "ServerAliveInterval 60" >> ~/.ssh/config

}

function proc() {
    echo "Begin Configure..."

    if [[ "${INIT_VIM}" == "true" ]]; then
        init_vim
    fi
    
    if [[ "${INIT_EMACS}" == "true" ]]; then
        init_emacs
    fi

    if [[ "${INIT_PACKAGE}" == "true" ]]; then
        init_package
    fi

    if [[ "${INIT_XPACKAGE}" == "true" ]]; then
        init_xpackage
    fi

    if [[ "${INIT_PYTHON}" == "true" ]]; then
        init_python
    fi

    if [[ "${INIT_SHELL}" == "true" ]]; then
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
      t)
          INIT_SSH=true
          init_ssh
          ;;
      h)
          INIT_SSHD=true
          init_sshd
          ;;
      d)
          INIT_DEV=true
          init_dev
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

