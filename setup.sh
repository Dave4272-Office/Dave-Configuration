sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins

git submodule add -f https://github.com/djui/alias-tips
git submodule add -f https://github.com/zsh-users/zsh-autosuggestions
git submodule add -f https://github.com/zsh-users/zsh-completions
git submodule add -f https://github.com/agkozak/zsh-z
git submodule add -f https://github.com/MichaelAquilina/zsh-auto-notify auto-notify
git submodule add -f https://github.com/marlonrichert/zsh-autocomplete
git submodule add -f https://github.com/z-shell/F-Sy-H
git submodule add -f https://github.com/unixorn/git-extra-commands
git submodule add -f https://github.com/Aloxaf/fzf-tab
git submodule add -f https://github.com/hlissner/zsh-autopair
git submodule update --init

pip install thefuck

# install required font

# install zsh theme
cd ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/themes/
git submodule add -f https://github.com/romkatv/powerlevel10k
git submodule update --init
