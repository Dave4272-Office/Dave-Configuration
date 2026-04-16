#!/bin/bash
set -euo pipefail

REPO_DIR="/media/dave/Workspace/Codes/Dave-Configuration"

#==========================================
# System packages (Manjaro / Arch)
#==========================================
# Tools assumed by the dotfiles at runtime. Install in a single transaction.
sudo pacman -S --needed --noconfirm \
    zsh \
    git \
    wget \
    unzip \
    tmux \
    fzf \
    fd \
    direnv \
    podman \
    github-cli \
    fastfetch \
    asdf-vm

#==========================================
# Oh-My-Zsh
#==========================================
ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"

if [[ ! -d "${ZSH}" ]]; then
    curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o /tmp/ohmyzsh-install.sh
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh /tmp/ohmyzsh-install.sh
    rm -f /tmp/ohmyzsh-install.sh
fi

#==========================================
# fzf shell integration
#==========================================
# The pacman `fzf` package installs the binary; the shell keybindings/completion
# live in ~/.fzf when cloned manually.
if [[ ! -d "${HOME}/.fzf" ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.fzf"
    "${HOME}/.fzf/install" --key-bindings --completion --no-update-rc
fi

#==========================================
# Oh-My-Zsh custom plugins
#==========================================
# Plain clones, not submodules — neither this repo nor ~/.oh-my-zsh tracks them.
clone_plugin() {
    local url="$1"
    local dir="$2"
    local target="${ZSH_CUSTOM}/plugins/${dir}"
    if [[ ! -d "${target}" ]]; then
        git clone --depth 1 "${url}" "${target}"
    fi
}

clone_plugin https://github.com/tamcore/autoupdate-oh-my-zsh-plugins.git         autoupdate
clone_plugin https://github.com/djui/alias-tips                                  alias-tips
clone_plugin https://github.com/zsh-users/zsh-autosuggestions                    zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-completions                        zsh-completions
clone_plugin https://github.com/agkozak/zsh-z                                    zsh-z
clone_plugin https://github.com/MichaelAquilina/zsh-auto-notify                  auto-notify
clone_plugin https://github.com/marlonrichert/zsh-autocomplete                   zsh-autocomplete
clone_plugin https://github.com/z-shell/F-Sy-H                                   F-Sy-H
clone_plugin https://github.com/unixorn/git-extra-commands                       git-extra-commands
clone_plugin https://github.com/Aloxaf/fzf-tab                                   fzf-tab
clone_plugin https://github.com/hlissner/zsh-autopair                            zsh-autopair

# Generated completion plugins (see linux/zsh/.zshrc plugin list)
if command -v pipx >/dev/null 2>&1; then
    mkdir -p "${ZSH_CUSTOM}/plugins/pipx"
    register-python-argcomplete pipx > "${ZSH_CUSTOM}/plugins/pipx/_pipx"
fi
if command -v poetry >/dev/null 2>&1; then
    mkdir -p "${ZSH_CUSTOM}/plugins/poetry"
    poetry completions zsh > "${ZSH_CUSTOM}/plugins/poetry/_poetry"
fi

#==========================================
# Nerd Fonts
#==========================================
install_nerd_font() {
    local archive="$1"
    local dir_name="$2"
    local version="v3.4.0"
    local font_dir="${HOME}/.local/share/fonts/${dir_name}"
    if [[ -d "${font_dir}" ]]; then
        return 0
    fi
    mkdir -p "${font_dir}"
    wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/${archive}" \
        -O "/tmp/${archive}"
    unzip -q "/tmp/${archive}" -d "${font_dir}"
    rm -f "/tmp/${archive}"
}

mkdir -p "${HOME}/.local/share/fonts"
install_nerd_font Terminus.zip       "Terminus Nerd Font"
install_nerd_font SourceCodePro.zip  "SourceCodePro Nerd Font"
install_nerd_font FiraCode.zip       "FiraCode Nerd Font"
install_nerd_font OpenDyslexic.zip   "OpenDyslexic Nerd Font"
fc-cache -f

#==========================================
# Powerlevel10k theme
#==========================================
if [[ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]]; then
    git clone --depth 1 https://github.com/romkatv/powerlevel10k.git \
        "${ZSH_CUSTOM}/themes/powerlevel10k"
fi

#==========================================
# Config symlinks
#==========================================
# Oh-My-Zsh installed a stock ~/.zshrc — drop it before we symlink ours in.
[[ -f "${HOME}/.zshrc" && ! -L "${HOME}/.zshrc" ]] && rm "${HOME}/.zshrc"
[[ -f "${HOME}/.p10k.zsh" && ! -L "${HOME}/.p10k.zsh" ]] && rm "${HOME}/.p10k.zsh"

ln -sfn "${REPO_DIR}/linux/zsh/.zshrc"       "${HOME}/.zshrc"
ln -sfn "${REPO_DIR}/linux/zsh/.p10k.zsh"    "${HOME}/.p10k.zsh"
ln -sfn "${REPO_DIR}/linux/zsh/.zshth.zsh"   "${HOME}/.zshth.zsh"

ln -sfn "${REPO_DIR}/linux/.aliases.sh"      "${HOME}/.aliases.sh"
ln -sfn "${REPO_DIR}/linux/.dircolors"       "${HOME}/.dircolors"
ln -sfn "${REPO_DIR}/linux/.functions.sh"    "${HOME}/.functions.sh"
ln -sfn "${REPO_DIR}/linux/.options.sh"      "${HOME}/.options.sh"
ln -sfn "${REPO_DIR}/linux/.condarc"         "${HOME}/.condarc"
ln -sfn "${REPO_DIR}/linux/.tmux.conf"       "${HOME}/.tmux.conf"

#==========================================
# asdf plugins
#==========================================
# asdf-vm 0.18+ resolves shortnames from the plugin index — no URL needed.
for plugin in nodejs python golang julia r ruby; do
    if ! asdf plugin list 2>/dev/null | grep -qx "${plugin}"; then
        asdf plugin add "${plugin}"
    fi
done

#==========================================
# GPG agent
#==========================================
mkdir -p "${HOME}/.gnupg"
chmod 700 "${HOME}/.gnupg"
ln -sfn "${REPO_DIR}/linux/gpg-agent.conf" "${HOME}/.gnupg/gpg-agent.conf"

#==========================================
# Manual follow-ups (not automated)
#==========================================
# - Anaconda: install from https://www.anaconda.com/download (expected at /opt/anaconda)
# - pnpm:     `curl -fsSL https://get.pnpm.io/install.sh | sh -`
# - GPG keys: import with `gpg --import <key>` and trust with `gpg --edit-key <id> trust`
# - Docker:   data-root / IPv6 tweaks in /etc/docker/daemon.json (host-specific)
# - Set login shell to zsh:  `chsh -s "$(command -v zsh)"`
