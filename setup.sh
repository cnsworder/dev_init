#!/usr/bin/env bash
# author: cnsworder
# email: cnsworder@gmail.com
# date: 2014-02-14
# version: 1.1

BASE_DIR= $(cd $(dirname ${BASH_SOURCE[0]})) && pwd
ln -s ${BASE_DIR} ~/.config/dev_init


source package.sh

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
#        yes | apt-get update
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
    elif which brew; then
        PM=brew
        PM_INSTALL=install
        PM_UPDATE=update
        OS="Mac OS X"
    fi

    echo "OS: $OS"
    echo "Package Manager: $PM"
}

function update_package() {
    yes | ${PM} ${PM_UPDATE}
}

pre_package

HAVE_REAL_PATH=true

if ! which realpath > /dev/null ; then
   echo "${PM} ${PM_INSTALL} realpath"
   yes | ${PM} ${PM_INSTALL} realpath
   if (( $? != 0 )); then
        HAVE_REAL_PATh=false
   fi
fi

if ${HAVE_REAL_PATH} ; then
    THIS_PATH=$(realpath .)
else
    THIS_PATH=`pwd`
fi

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
          ln -s ${THIS_PATH}/config/awesome/rc.lua ~/.config/rc.lua
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

    if [ -e ~/.vimrc ];then
        mv ~/.vimrc ~/.vimrc.bak
        echo "backup ~/.vimrc to ~/.vimrc.bak"
    fi
    ln -s ${THIS_PATH}/vimrc ~/.vimrc
    vim +PluginInstall +qall

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
       ELPA="$(pwd)/elpa"
       sed -i "s,;;{{VERSION}},(if (<= emacs-major-version 23)\n    (add-to-list \'load-path \"${ELPA}\")),g" emacs
       #TODO: 经常出错emacs 24以下版本暂时不支持了
       return
    fi

    if [ -e ~/.emacs ];then
        mv ~/.emacs ~/.emacs.bak
        echo "backup ~/.emacs to ~/.emacs.bak"
    fi
    ln -s ${THIS_PATH}/emacs.d ~/.emacs.d

    # emacs -nw -f install-custom-package
    cd ~/.emacs.d && cask install
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

    ln -s ${THIS_PATH}/pip/pip.conf ~/.pip/pip.conf


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

    # git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    # cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh `which zsh`

    cd crossh && ./install.sh

    ln -s Xdefaults ~/.Xdefaults
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

while getopts "vepkxsthda" arg
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
