#!/bin/env bash

source package.sh

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

IS_ROOT=$(id -u)


function init_package() {

    echo "Installing packages..."

    if [[ "${IS_ROOT}" != "0" ]]; then
        return
    fi

    update_package

    yes | ${PM} ${PM_INSTALL} ${PACKAGES}

}

