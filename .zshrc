function load_omz() {
    echo "Loading oh-my-zsh"
    export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
    if [ ! -d ${ZSH} ]; then
        git clone https://github.com/robbyrussell/oh-my-zsh.git ${ZSH}
    fi
    source $ZSH/oh-my-zsh.sh
}

function load_plugs() {
    echo "Loading plugins..."

    # Make sure to use double quotes to prevent shell expansion
    zplug "zplug/zplug", hook-build:"zplug --self-manage"
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "zsh-users/zsh-completions"
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-history-substring-search"
    # zplug "djui/alias-tips"
    # zplug "willghatch/zsh-snippets"
    zplug "supercrabtree/k"
    zplug "plugins/git", from:oh-my-zsh
    zplug "plugins/tmux", from:oh-my-zsh
    # zplug "plugins/zsh_reload", from:oh-my-zsh
    # zplug "plugins/z", from:oh-my-zsh
    zplug "plugins/fasd", from:oh-my-zsh
    # zplug "plugins/autojump", from:oh-my-zsh
    zplug "themes/ys", as:theme, from:oh-my-zsh

    zplug "plugins/brew", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
    zplug "plugins/cask", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
    zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
    zplug "iam4x/zsh-iterm-touchbar", if:"[[ $OSTYPE == *darwin* ]]"

    zplug "plugins/linux", from:oh-my-zsh, if:"[[ $OSTYPE == *linux* ]]"

    if which fzf &> /dev/null; then
        zplug "/usr/local/opt/fzf/shell", from:local, if:"[[ $OSTYPE == *darwin* ]]"
        zplug "/usr/share/fzf", from:local, if:"[[ $OSTYPE == *linux* ]]"
        zplug "urbainvaes/fzf-marks"
    else
        zplug "jocelynmallon/zshmarks"
    fi
    if [ -d ~/dev/tools ]; then
        zplug "~/dev/tools", from:local, use:"*.sh"
    fi
}

function check() {
    echo -n "\nplug check..."
    if ! zplug check; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        else
            echo
        fi
    fi
    touch ~/.zplug/.installed
}

function init_python_env() {

    # virtualenvwrapper
    if [ -d $HOME/.virtualenvs ]; then
        export WORKON_HOME=$HOME/.virtualenvs
        source /usr/local/bin/virtualenvwrapper.sh
    fi

    # pyenv
    if [  -d $HOME/.pyenv ]; then
        export PYENV_ROOT=$HOME/.pyenv
        eval "$(pyenv init -)"
    fi

    echo "init python env..."
}


function echo_logo () {
    echo  " \e[92m
██╗       ██████╗██████╗  ██████╗ ███████╗███████╗      ██╗
╚██╗     ██╔════╝██╔══██╗██╔═══██╗██╔════╝██╔════╝     ██╔╝
 ╚██╗    ██║     ██████╔╝██║   ██║███████╗███████╗    ██╔╝
 ██╔╝    ██║     ██╔══██╗██║   ██║╚════██║╚════██║    ╚██╗
██╔╝     ╚██████╗██║  ██║╚██████╔╝███████║███████║     ╚██╗
╚═╝       ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝      ╚═╝
    \e[0m"
    tput rev;tput cup 9 10
    echo ">> $(whoami)@$(hostname) <<"
}

function init_env () {
    if which vim &> /dev/null; then
        export EDITOR=vim
    elif which emacs &> /dev/null; then
        export EDITOR=emacs
    fi

    # if which fasd &> /dev/null;then
    #     eval "$(fasd --init auto)"
    # fi
    #[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    if which direnv &> /dev/null; then
        eval "$(direnv hook zsh)"
    fi
    # eval "$(aliases init --global)"
    # bindkey '^j' snippet-expand

    [ -f ~/.environment ] && source ~/.environment
    [ -f ~/.aliases ] && source ~/.aliases
}

function init_zplug () {
    if [[ ! -d ~/.zplug ]]; then
        git clone https://github.com/zplug/zplug ~/.zplug && source ~/.zplug/init.zsh && zplug update
    fi

    if [ ! -d ~/.zplug ]; then
        return 1
    fi

    load_omz
    source ~/.zplug/init.zsh

    if which zplug &> /dev/null; then
        load_plugs
        if [ ! -e ~/.zplug/.installed ]; then
            check
        fi

        echo "zplug loaded..."
        zplug load
    fi
}

function init_iterm() {
    if [ '$(uname)' = 'Darwin' ]; then
        test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    fi
}

function init_ssh() {
    ssh-add &> /dev/null
}

function main() {
    init_zplug
    init_env
    init_python_env
    init_iterm
    init_ssh
    reset
    echo_logo
}


function linuxup() {
    if which dnf > /dev/null; then
        echo ">> dnf update application..."
        dnf -y update &> ~/allup.log
        return
    fi
    if which yum > /dev/null; then
        echo ">> yum update application..."
        yum -y update &> ~/allup.log
        return
    fi
    if which pacman > /dev/null; then
        echo ">> pacman update application..."
        yes | pacman -Syu &> ~/allup.log
        return
    fi
    if which aptitude > /dev/null; then
        echo ">> apt update application..."
        yes | aptitude update | aptitude upgrade &> ~/allup.log
        return
    fi
}

function macup() {
    if which brew &> /dev/null; then
        echo ">> brew update application..."
        yes | brew upgrade &> ~/allup.log
        brew cleanup &>> ~/.aliasesallup.log
    fi
}

function zshup() {
    echo ">> zplug update zsh..."
    zplug update &>> ~/allup.log
    zplug clear &>> ~/allup.log
}

function pipup() {
    echo ">> python pip update..."
    python3 -m pip install --upgrade $(python3 -m pip list --outdated | awk 'NR > 2 { print $1}' | tr '\n' ' ')
}

function emacsup() {
    if ! which emacs &> /dev/null; then
        return 2
    fi
    if ! which cask &> /dev/null; then
        return 3
    fi
    echo ">> cask update emacs..."
    if [ -d ~/.emacs.d ]; then
        cd ~/.emacs.d
        cask upgrade &>> ~/allup.log
        cask update &>> ~/allup.log
        cd - > /dev/null
    fi
}

function vimup() {
    if ! which vim &> /dev/null; then
        return 4
    fi
    echo ">> vimplug update vim..."
    vim +PlugUpdate\ --sync +PlugUpgrade\ --sync +PlugClean\ --sync +qall
    clear
}

function echolog() {
    cat ~/allup.log
    echo
}

function allup() {
    clear
    linuxup
    macup
    zshup
    pipup
    emacsup
    vimup
    echolog

    echo "[[ All plugin Upgraded! ]]"
}

function sshsync() {
    SRC=$1
    DIS=$2
    rsync -avrhP $1 $2 --exclude=".git*" --exclude=".DS_Store" --exclude=".svn*"
}

main
