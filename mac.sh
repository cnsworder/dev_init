#!/bin/env bash
# Mac OS X自动化配置


function backup_package() {
    brew list > brew.list
    brew cask list > cask.list
    mas list > mas.list
}

function install_package() {
   if [ -f "brew.list" ]; then
       cat brew.list | xargs brew install
   fi
   if [ -f "cask.list" ]; then
       cat cask.list | xargs brew cask instatll
   fi
   if [ -f "mas.list" ]; then
       cat mas.list |  awk '{print $1}' | xargs mas instatll
   fi
}
