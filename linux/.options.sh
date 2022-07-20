# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"
export CHEAT_USE_FZF=true

# golang paths
if [ -f $HOME/go ] ; then
    export GOPATH=$HOME/go
    export GOBIN=$GOPATH/bin
    export PATH=$GOBIN:$PATH
fi

# nvm paths
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/e/Tools/nvm"
[ -e "$NVM_DIR" ] || mkdir -p "$NVM_DIR"

if [ -f /usr/share/nvm ] ; then
    [ -f /usr/share/nvm/nvm.sh ] && source /usr/share/nvm/nvm.sh
    [ -f /usr/share/nvm/bash_completion ] && source /usr/share/nvm/bash_completion
    if [ -e "$NVM_DIR/nvm.sh" ] ; then
        rm -f "$NVM_DIR/nvm.sh"
        ln -s /usr/share/nvm/nvm.sh "$NVM_DIR/nvm.sh"
    else
        ln -s /usr/share/nvm/nvm.sh "$NVM_DIR/nvm.sh"
    fi
    if [ -e "$NVM_DIR/nvm-exec" ] ; then
        rm -f "$NVM_DIR/nvm-exec"
        ln -s /usr/share/nvm/nvm-exec "$NVM_DIR/nvm-exec"
    else
        ln -s /usr/share/nvm/nvm-exec "$NVM_DIR/nvm-exec"
    fi
elif [ -f $HOME/.nvm ] ; then
    [ -f $HOME/.nvm/nvm.sh ] && source $HOME/.nvm/nvm.sh
    [ -f $HOME/.nvm/bash_completion ] && source $HOME/.nvm/bash_completion
    if [ -e "$NVM_DIR/nvm.sh" ] ; then
        rm -f "$NVM_DIR/nvm.sh"
        ln -s $HOME/.nvm/nvm.sh "$NVM_DIR/nvm.sh"
    else
        ln -s $HOME/.nvm/nvm.sh "$NVM_DIR/nvm.sh"
    fi
    if [ -e "$NVM_DIR/nvm-exec" ] ; then
        rm -f "$NVM_DIR/nvm-exec"
        ln -s $HOME/.nvm/nvm-exec "$NVM_DIR/nvm-exec"
    else
        ln -s $HOME/.nvm/nvm-exec "$NVM_DIR/nvm-exec"
    fi
else
    unset NVM_DIR
fi

# yarn Paths
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=$HOME/bin:$PATH

# additional paths
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/sbin:$PATH

export PATH=/usr/games:$PATH
export PATH=/usr/local/games:$PATH
export PATH=/usr/share/games:$PATH

export PATH=/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH

export PATH=/usr/sandbox/:$PATH

export PATH=/snap/bin:$PATH

export PATH=~/.local/bin:$PATH

eval "$(dircolors ~/.dircolors)";
eval "$(thefuck --alias)"
