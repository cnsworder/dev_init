#
# cnsworder profile
#

DIR=$(cd "$(dirname $0)" && pwd)

#IM envrionment
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT5_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

export PATH=$PATH:~/bin:~/tools

export EDITOR=vim

if [[ "$TERM" == "linux" ]]; then
    export LC_MESSAGES="en_US.UTF-8"
fi

if [[ "${DISPLAY}" != "" ]]; then
    xhost + &> /dev/null
fi


#export XDG_CURRENT_DESKTOP=KDE
export QT_QPA_PLATFORMTHEME="qt5ct"

source ${DIR}/alias.conf

if [ ! -d /tmp/chrome ]; then
    mkdir /tmp/chrome
    if [ -d ~/.cache/chromium ]; then
        rm -rf ~/.cache/chromium
    fi
    ln -s /tmp/chrome ~/.cache/chromium
fi
