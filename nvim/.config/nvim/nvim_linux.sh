set -e
# install nerd font
# https://www.nerdfonts.com/font-downloads

# Save the original directory
ORIGINAL_DIR=$(pwd)

# Set a trap to return to the original directory on exit
trap "cd \"$ORIGINAL_DIR\"" EXIT

NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
NVIM_DIR="$HOME/.local/bin"
NVIM_TAR="nvim-linux-x86_64.tar.gz"

# Create directory if it doesn't exist
mkdir -p "$NVIM_DIR"

echo "Downloading Neovim..."
wget -O "$NVIM_TAR" "$NVIM_URL" || {
    echo "Failed to download Neovim"
    exit 1
}


# Extract the tarball
mv ${NVIM_TAR} ${NVIM_DIR}
cd "$NVIM_DIR" || exit 1
echo "Extracting Neovim..."
tar xzvf "$NVIM_TAR" || {
    echo "Failed to extract Neovim"
    exit 1
}
rm -rf "$NVIM_TAR" # cleanup


# Create symbolic link to the nvim executable
sudo ln -s "${NVIM_DIR}/nvim-linux-x86_64/bin/nvim" /usr/local/bin/nvim


sudo apt-get install ripgrep
sudo apt-get install fzf

