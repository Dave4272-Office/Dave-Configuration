#!/bin/bash
#==========================================
# ZSH Configuration
#==========================================
ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH:-~/.oh-my-zsh}/custom"
# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# installing fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# installing required zsh plugins
cd "${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins" || exit

git submodule add -f https://github.com/Dave4272-Office/autoupdate-oh-my-zsh-plugins.git autoupdate
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
cd ~ || exit

# install required font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts || exit
#Terminus
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Terminus.zip
mkdir "Terminus Nerd Font"
unzip Terminus.zip -d "Terminus Nerd Font"
rm Terminus.zip

#SourceCodePro
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/SourceCodePro.zip
mkdir "SourceCodePro Nerd Font"
unzip SourceCodePro.zip -d "SourceCodePro Nerd Font"
rm SourceCodePro.zip

#FiraCode
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
mkdir "FiraCode Nerd Font"
unzip FiraCode.zip -d "FiraCode Nerd Font"
rm FiraCode.zip

#OpenDyslexic
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/OpenDyslexic.zip
mkdir "OpenDyslexic Nerd Font"
unzip OpenDyslexic.zip -d "OpenDyslexic Nerd Font"
rm OpenDyslexic.zip

# clear and regenerate font cache
fc-cache -f -v
cd ~ || exit

# install zsh theme
cd "${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/themes" || exit
git submodule add -f https://github.com/romkatv/powerlevel10k
git submodule update --init
cd ~ || exit
# modify existing .zshrc to change theme to p10k

# run p10k configure

# installing asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

# Create links to proper configs
cp ~/.p10k.zsh /media/dave/Workspace/Codes/Dave-Configuration/linux/zsh/
rm .zshrc
rm .p10k.zsh

ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/zsh/.zshrc ~/.zshrc
ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/zsh/.p10k.zsh ~/.p10k.zsh
ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/zsh/.zshth.zsh ~/.zshth.zsh

ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/.aliases.sh ~/.aliases.sh
ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/.dircolors ~/.dircolors
ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/.functions.sh ~/.functions.sh
ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/.options.sh ~/.options.sh
#==========================================

#==========================================
# asdf Configuration
#==========================================
# install asdf plugins
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add python https://github.com/danhper/asdf-python.git

# install asdf runtimes


#==========================================

#==========================================
# Docker Steps
#==========================================
# set docker root dir

# enable ipv6

#==========================================

#==========================================
# GPG Configs
#==========================================
# set gpg-agent for ssh
ln -s /media/dave/Workspace/Codes/Dave-Configuration/linux/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# set gpg keys

#==========================================
