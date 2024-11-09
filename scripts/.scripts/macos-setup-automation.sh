#!/bin/bash

# -------------------------------------------------------------------------------------------------
# STRICT MODE
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
# -------------------------------------------------------------------------------------------------
set -euo pipefail
IFS=$'\n\t'


# -------------------------------------------------------------------------------------------------
# Manually install these
# -------------------------------------------------------------------------------------------------
# Xcode
# FileZilla
# Automator


# -------------------------------------------------------------------------------------------------
# Install Xcode command line Tools
# -------------------------------------------------------------------------------------------------
xcode-select --install

# -------------------------------------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------------------------------------
SUDO_USER=$(whoami)


# -------------------------------------------------------------------------------------------------
# Check for Homebrew, install if not installed
# -------------------------------------------------------------------------------------------------
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew repos
brew update
brew upgrade


# -------------------------------------------------------------------------------------------------
# find the CLI Tools update
# -------------------------------------------------------------------------------------------------
echo "Finding CLI tools updates..."
PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n') || true
# install it
if [[ ! -z "$PROD" ]]; then
    softwareupdate -i "$PROD" --verbose
fi


# -------------------------------------------------------------------------------------------------
# Install oh-my-zsh and powerlevel10k
# -------------------------------------------------------------------------------------------------
echo "Installing oh-my-zsh and powerlevel10k..."
# oh-my-szh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
zsh_theme="powerlevel10k/powerlevel10k"
sed -i '' "s/robbyrussell/$zsh_theme/g" ~/.zshrc


# -------------------------------------------------------------------------------------------------
# GNU Core Tools and utilities
# -------------------------------------------------------------------------------------------------
echo "Installing GNU Tools and utilities..."
brew install coreutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-indent
brew install gnu-which
brew install findutils


# -------------------------------------------------------------------------------------------------
# ZSH Tools
# -------------------------------------------------------------------------------------------------
echo "Installing ZSH Tools..."
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-completions
brew install zsh-history-substring-search
brew install zsh-interactive-cd
brew install zsh-navigation-tools


# -------------------------------------------------------------------------------------------------
# PACKAGES
# -------------------------------------------------------------------------------------------------
PACKAGES=(
    node
    npm
    nvm
    wget
    terminal-notifier
    postgresql
    bash
    hub
    imagemagick
    python
    python3
    pypy
    git
    stow
    only-switch
    fswatsh
    jq
    sass/sass/sass
    neovim
    koekeishiya/formulae/skhd
    koekeishiya/formulae/yabai
    tmux
    tree-sitter
    trash
    fzf
    fd
    powerlevel10k
    socsieng/tap/sendkeys
)
CASKS=(
    boom-3d
    google-drive
    mamp
    google-chrome
    rocket
    logi-options+
    wacom-tablet
    contexts
    tomatobar
    monitorcontrol
    devtoys
    kitty
    alacritty
    pika
    captin
    blender
    gimp
    vscodium
    inkscape
    vlc
    vivaldi
    balance-lock
    karabiner-elements
    onlyoffice
    owncloud
    rawtherapee
    the-unarchiver
    transmission
    whisky
    appcleaner
    firefox@developer-edition
    openemu
    krita
    sequel-ace
    itsycal
    zoom
    steam
    keepingyouawake
    qlstephen
    suspicious-package
)
PYTHON_PACKAGES=(
    ipython
    virtualenv
    virtualenvwrapper
)

# -------------------------------------------------------------------------------------------------
# Installing packages
# -------------------------------------------------------------------------------------------------
echo "Installing Homebrew packages..."
brew install ${PACKAGES[@]}

echo "Installing Homebrew cask apps..."
sudo -u $SUDO_USER brew install --cask ${CASKS[@]}

echo "Installing Python packages..."
sudo -u $SUDO_USER pip3 install --upgrade pip
sudo -u $SUDO_USER pip3 install --upgrade setuptools
sudo -u $SUDO_USER pip3 install ${PYTHON_PACKAGES[@]}

echo "Installing global npm packages..."
sudo -u $SUDO_USER npm install marked -g


# -------------------------------------------------------------------------------------------------
# Yabai and skhd
# -------------------------------------------------------------------------------------------------
echo "Starting Yabai and skhd services..."
skhd --start-service
yabai --start-service

echo "Adding Git configuration..."
git config --global user.name "David Diosdado"
git config --global user.email diosdado@trigger.mx

# -------------------------------------------------------------------------------------------------
# PHP LSP
# -------------------------------------------------------------------------------------------------
# phpactor
curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
sudo -u $SUDO_USER chmod a+x phpactor.phar
sudo -u $SUDO_USER mv phpactor.phar ~/.local/bin/phpactor
# php-cs-fixer
curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o php-cs-fixer
sudo -u $SUDO_USER chmod a+x php-cs-fixer
sudo -u $SUDO_USER mv php-cs-fixer /usr/local/bin/php-cs-fixer

# -------------------------------------------------------------------------------------------------
# Cleanup
# -------------------------------------------------------------------------------------------------
echo "Cleaning up"
brew cleanup
echo "Ask the doctor"
brew doctor
echo "Installations done"












