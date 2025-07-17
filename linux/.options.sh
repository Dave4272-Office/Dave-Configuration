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

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"
export CHEAT_USE_FZF=true

# golang paths
if [[ -d ${HOME}/go ]]; then
    export GOPATH=${HOME}/go
    export GOBIN=${GOPATH}/bin
    export PATH=${GOBIN}:${PATH}
fi

# nvm paths
[[ -z "${workspace}" ]] && export workspace="/E:"

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
export PATH=~/.odrive-agent/bin/:${PATH}
export PATH=/media/dave/Workspace/Codes/GraphQL/telosys-cli-4.1.1-001/:${PATH}

export PATH=/home/dave/.ghcup/bin/:${PATH}

export ASDF_DATA_DIR=${HOME}/.asdf
export PATH=${ASDF_DATA_DIR}/shims:${PATH}

export PATH=${HOME}/.claude/local:${PATH}

# export PATH=~/.local/share/gem/ruby/3.0.0/bin:${PATH}

export GCM_CREDENTIAL_STORE=secretservice
export DOCKER_HOST=unix:///run//user//1000//podman//podman.sock
export JAVA_HOME=/usr/lib/jvm/default-runtime
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia

