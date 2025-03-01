set -e

# ===== Install zsh =====
# ref: https://www.kwchang0831.dev/dev-env/ubuntu/oh-my-zsh
sudo apt-get update
sudo apt-get install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

zsh
