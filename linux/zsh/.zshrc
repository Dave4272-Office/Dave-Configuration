# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

setopt hist_ignore_dups
setopt hist_expire_dups_first

SAVEHIST=99999

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Plugins
plugins=(
  adb
  alias-tips
  ansible
  archlinux
  #asdf
  auto-notify
  colored-man-pages
  colorize
  common-aliases
  debian
  direnv
  dirhistory
  dnf
  docker
  docker-compose
  extract
  F-Sy-H
  fasd
  fzf-tab
  gh
  git
  git-extra-commands
  globalias
  gpg-agent
  magic-enter
  pip
  supervisor
  suse
  systemd
  vscode
  web-search
  yum
  zsh-autocomplete
  zsh-autopair
  zsh-autosuggestions
  zsh-completions
  zsh-z
  fzf                         # for fzf ^R binding
)

# Modules
autoload -U zmv
autoload -U compinit && compinit #Keep at last

source $ZSH/oh-my-zsh.sh

# Theme configuration.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Theme customizations
[[ ! -f ~/.zshth.zsh ]] || source ~/.zshth.zsh

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# options
[[ -f ~/.options.sh ]] && source ~/.options.sh

# aliases
[[ -f ~/.aliases.sh ]] && source ~/.aliases.sh

# functions
[[ -f ~/.functions.sh ]] && source ~/.functions.sh
