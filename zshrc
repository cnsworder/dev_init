export EDITOR=vim
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
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/brew-cask", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "themes/amuse", as:theme, from:oh-my-zsh

zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug "/usr/local/opt/fzf/shell", from:local
zplug "~/dev/tools", from:local, use:"*.sh"

# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
