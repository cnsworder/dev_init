#
# cnsworder profile
#

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
    xhost +
fi


#export XDG_CURRENT_DESKTOP=KDE
export QT_QPA_PLATFORMTHEME="qt5ct"

source alias.conf
