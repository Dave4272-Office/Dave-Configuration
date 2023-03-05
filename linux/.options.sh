#!/bin/bash
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

#. ${HOME}/.asdf/asdf.sh
#. ${HOME}/.asdf/completions/asdf.bash

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"
export CHEAT_USE_FZF=true

# golang paths
if [[ -f ${HOME}/go ]]; then
    export GOPATH=${HOME}/go
    export GOBIN=${GOPATH}/bin
    export PATH=${GOBIN}:${PATH}
fi

# nvm paths
[[ -z "${workspace}" ]] && export workspace="/E:"
if [[ -d "${workspace}" ]]; then
    [[ -z "${NVM_DIR}" ]] && export NVM_DIR="/home/dave/.nvm"
    [[ -e "${NVM_DIR}" ]] || mkdir -p "${NVM_DIR}"
fi

if [[ -n "${NVM_DIR}" ]]; then
    if [[ -d /usr/share/nvm ]]; then
        [[ -f /usr/share/nvm/nvm.sh ]] && source /usr/share/nvm/nvm.sh
        [[ -f /usr/share/nvm/bash_completion ]] && source /usr/share/nvm/bash_completion
        ln -sf /usr/share/nvm/nvm.sh "${NVM_DIR}/nvm.sh"
        ln -sf /usr/share/nvm/nvm-exec "${NVM_DIR}/nvm-exec"
    elif [[ -f ${HOME}/.nvm ]]; then
        [[ -f ${HOME}/.nvm/nvm.sh ]] && source "${HOME}/.nvm/nvm.sh"
        [[ -f ${HOME}/.nvm/bash_completion ]] && source "${HOME}/.nvm/bash_completion"
        ln -sf "${HOME}/.nvm/nvm.sh" "${NVM_DIR}/nvm.sh"
        ln -sf "${HOME}/.nvm/nvm-exec" "${NVM_DIR}/nvm-exec"
    else
        unset NVM_DIR
    fi
fi

# yarn Paths
export PATH=${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}
export PATH=${HOME}/bin:${PATH}

# additional paths
export PATH=/sbin:${PATH}
export PATH=/usr/sbin:${PATH}
export PATH=/usr/local/sbin:${PATH}

export PATH=/usr/games:${PATH}
export PATH=/usr/local/games:${PATH}
export PATH=/usr/share/games:${PATH}

export PATH=/bin:${PATH}
export PATH=/usr/bin:${PATH}
export PATH=${HOME}/bin:${PATH}
export PATH=/usr/local/bin:${PATH}

export PATH=/usr/sandbox/:${PATH}

export PATH=/snap/bin:${PATH}

export PATH=~/.local/bin:${PATH}
export PATH=~/.dotnet/tools:${PATH}

export GCM_CREDENTIAL_STORE=secretservice

eval "$(dircolors ~/.dircolors)" || true;
