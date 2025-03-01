#!/bin/bash

# Save the original directory
ORIGINAL_DIR=$(pwd)

# Set a trap to return to the original directory on exit
trap "cd \"$ORIGINAL_DIR\"" EXIT

# Get script path
DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LINUX_INSTALL_ROOTS="${DOTFILES_ROOT}/install/linux"

MAIN_PACKAGE_NAME="main"
NVIM_PACKAGE_NAME="nvim"

echo "Dotfiles root located at: $DOTFILES_ROOT"

source "${LINUX_INSTALL_ROOTS}/basics.sh"
source "${LINUX_INSTALL_ROOTS}/cpp.sh"
source "${LINUX_INSTALL_ROOTS}/python.sh"

cd "${DOTFILES_ROOT}"


# NeoVim Settings
source "${DOTFILES_ROOT}/nvim/.config/nvim/nvim_linux.sh"

# stow ${MAIN_PACKAGE_NAME}

# ZSH Settings
# source "${LINUX_INSTALL_ROOTS}/zsh.sh"
# zsh
# sed -i 's#^ZSH_THEME=.*$#ZSH_THEME="powerlevel10k/powerlevel10k"#' ~/.zshrc

# Additional steps:
# download fonts and set it as the terminal font
# wget https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf &&

# rm "~/.zshrc"