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

sleep 2


# -------------------------------------------------------------------------------------------------
# PACKAGES
# -------------------------------------------------------------------------------------------------
PACKAGES=(
    git
    bash
    dart-lang/dart/dart
    meson # buildsystem
    pypy
    python
    python3
    pipx # execute python binares
    node
    nvm # manage multiple node versions
    yarn # js package manager
    pnpm # node package manager
    tree-sitter # language parser

    coreutils # gnu core utilities
    findutils # gfind, glocate, gupdatedb, gxargs
    gnu-indent
    gnu-sed
    gnu-tar
    gnu-which
    gawk # gnu awk
    grep
    inetutils # network utilities
    wget

    clamav # antivirus
    socat # sockets
    buf # work with protocol buffers
    pstree # ps in a tree
    ncdu # disk usage
    fzf # fuzzy finder
    fd # alternative to find
    jq # process json
    tree # tree view of directories
    ripgrep # rg, like grep

    postgresql
    sass/sass/sass
    composer

    neovim
    yazi
    stow
    tmux
    bat
    cmatrix
    fastfetch
    htop
    cava # mic preview
    switchaudio-osx # togge mute mic
    socsieng/tap/sendkeys # send keystrokes in mac
    pv # pipe viewer
    watch # executes a program periodically
    watchexec # execute commands when watched files change
    fswatch # monitor changes in files or directories
    gh # github
    lynx # web browser
    yt-dlp # youtube downloader

    pandoc # render to different file types
    glow # render markdown in terminal
    imagemagick
    sevenzip
    poppler
    resvg
    ffmpeg

    powerlevel10k
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-navigation-tools
    zsh-syntax-highlighting
    zsh-interactive-cd

    koekeishiya/formulae/yabai
    jeffreywildman/virt-manager/virt-viewer
    felixkratz/formulae/borders
    terminal-notifier
)


CASKS=(
    contexts
    karabiner-elements
    bettertouchtool
    only-switch
    monitorcontrol
    wacom-tablet
    macfuse
    owncloud
    free-ruler
    homerow
    instantview
    onyx
    boom-3d
    appcleaner
    anybar

    librewolf
    brave-browser
    vscodium
    kitty
    blender
    gimp
    inkscape
    drawio
    affinity
    rawtherapee
    qcad
    onlyoffice
    mysqlworkbench
    obs
    mamp
    michaelvillar-timer
    vlc
    transmit
    transmission
    hex-fiend
    openvpn-connect
    windows-app
    utm

    whatsapp
    jitsi-meet
    zoom
    microsoft-teams

    whisky
    openemu
    steam
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
# Yabai
# -------------------------------------------------------------------------------------------------
echo "Starting Yabai..."
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
# curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o php-cs-fixer
# sudo -u $SUDO_USER chmod a+x php-cs-fixer
# sudo -u $SUDO_USER mv php-cs-fixer /usr/local/bin/php-cs-fixer







# -------------------------------------------------------------------------------------------------
# Cleanup
# -------------------------------------------------------------------------------------------------
echo "Cleaning up"
brew cleanup
echo "Ask the doctor"
brew doctor
echo "Installations done"

brew install pipx


npm i -g pyright
npm i -g sql-language-server
npm i -g bash-language-server
npm i -g dockerfile-language-server-nodejs
pipx install python-lsp-server

git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier



