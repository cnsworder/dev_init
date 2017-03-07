if which vim > /dev/null; then
    export EDITOR=vim
fi
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update
fi

export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "djui/alias-tips"
zplug "willghatch/zsh-snippets"
zplug "supercrabtree/k"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/cask", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "themes/amuse", as:theme, from:oh-my-zsh

zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/linux", from:oh-my-zsh, if:"[[ $OSTYPE == *linux* ]]"

if which fzf > /dev/null; then
    zplug "/usr/local/opt/fzf/shell", from:local, if:"[[ $OSTYPE == *darwin* ]]"
    zplug "/usr/share/fzf", from:local, if:"[[ $OSTYPE == *linux* ]]"
    zplug "urbainvaes/fzf-marks"
else
    zplug "jocelynmallon/zshmarks"
fi
if [ -d ~/dev/tools ]; then
    zplug "~/dev/tools", from:local, use:"*.sh"
fi

# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^j' snippet-expand

function allup() {
    if which brew; then
        echo "brew update application..."
        yes | brew upgrade
        brew cleanup
    fi

    echo "zplug update zsh..."
    zplug update
    zplug clear

    if which cask; then
        echo "cask update emacs..."
        if [ -d ~/.emacs.d ]; then
            cd ~/.emacs.d
            cask upgrade
            cask update
            cd -
        fi
    fi

    if which vim > /dev/null; then
        echo "vimplug update vim..."
        vim +PlugUpdate\ --sync +PlugUpgrade\ --sync +PlugClean\ --sync +qall
    fi
}
