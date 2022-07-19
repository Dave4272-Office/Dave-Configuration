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
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export CHEAT_USE_FZF=true
export PATH=$GOBIN:$PATH

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/e/Tools/nvm"
[ -f /usr/share/nvm/nvm.sh ] && source /usr/share/nvm/nvm.sh
[ -f /usr/share/nvm/bash_completion ] && source /usr/share/nvm/bash_completion
[ -f /usr/share/nvm/install-nvm-exec ] && source /usr/share/nvm/install-nvm-exec

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=$HOME/bin:$PATH

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/share/games:$PATH
export PATH=/usr/games:$PATH
export PATH=/usr/local/games:$PATH
export PATH=/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sandbox/:$PATH
export PATH=/snap/bin:$PATH
export PATH=~/.local/bin:$PATH
