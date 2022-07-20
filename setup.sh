 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

 git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins

git submodule add -f https://github.com/djui/alias-tips
git submodule add -f https://github.com/zdharma-continuum/fast-syntax-highlighting
git submodule add -f https://github.com/zsh-users/zsh-autosuggestions
git submodule add -f https://github.com/zsh-users/zsh-completions
git submodule add -f https://github.com/zsh-users/zsh-syntax-highlighting
git submodule add -f https://github.com/agkozak/zsh-z
git submodule update --init

# install required font

cd ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/themes/
git submodule add -f https://github.com/romkatv/powerlevel10k
git submodule update --init
