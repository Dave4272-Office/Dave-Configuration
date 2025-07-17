#!/bin/bash
# snap alias
# trunk-ignore(shellcheck/SC2312)
if [[ -n "$(command -v snap)" ]]; then
    alias snls='snap list'
    alias sndiff='snap changes'
    alias snupg='sudo snap refresh'
    alias snrm='sudo snap remove'
    alias snins='sudo snap install'
fi

alias ytdl="youtube-dl"

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'
alias em='emacs -nw'
alias dd='dd status=progress'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

alias egrep='grep -E'

alias bvmrm='bvm remove --all --keep-latest-versions 2'
