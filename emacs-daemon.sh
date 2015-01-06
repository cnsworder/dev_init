count=`ps ax | grep "emacs --daemon" -c`
if [ "$count" == "1" ]; then
    emacs --daemon
fi

alias ec="emacsclient -c"
alias em="emacsclient -t"
