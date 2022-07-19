#!/bin/bash

# https://gist.github.com/vratiu/9780109
Color_Off="\033[0m"       # Text Reset
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
White="\033[0;37m"        # White

function cmd_missing() {
    if command -v $1 > /dev/null; then
        false
    else
        true
    fi
}

function symlink() {
    ln -sf $1 $2
}

function log_start() {
    echo -e "${Blue}$1${Color_Off}"
}

function log_end() {
    echo -e "${Green}$1${Color_Off}"
}

symlink ~/.dotfiles/.zprofile ~/.zprofile
symlink ~/.dotfiles/.zshrc ~/.zshrc
log_end "Dotfile symlinks created"
echo

sudo sed -i '' '3i\  
auth       sufficient     pam_tid.so'$'\n' '/etc/pam.d/sudo'
sudo uniq /etc/pam.d/sudo > /tmp/sudo_uniq
sudo mv /tmp/sudo_uniq /etc/pam.d/sudo
log_end "Configured Touch ID for sudo"
echo

log_start "Installing 'brew' and dependencies from 'Brewfile'"
if cmd_missing brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
   
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.dotfiles/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)" > /dev/null

    log_end 'Brew installed'
else
    log_end 'Brew detected'
fi
brew bundle --file ~/.dotfiles/Brewfile
echo

osascript -e '
tell application "System Events"
    tell dock preferences
	set properties to {autohide:true,screen edge:left}
    end tell
end tell'
defaults write com.apple.dock autohide-delay -float 0
killall Dock
log_end "Dock configured"
echo

log_start "Installing Rust"
if !command -v rustc &> /dev/null; then
    rustup-init -y
    log_end "Rust installed"
else
    rustc -V
    log_end "Rust detected"
fi

echo

log_start "Installing NodeJS"
if !command -v node &> /dev/null; then
    fnm use 16 --install-if-missing
    log_end "NodeJS installed"
else
    node -v
    log_end "NodeJS detected"
fi
echo

log_start "Configuring neovim"
if ! test -e ~/.local/share/nvim/site/autoload/plug.vim; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    log_end "vim-plug installed"
else
    log_end "vim-plug detected"
fi

if ! test -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    log_end "packer.nvim installed"
else
    log_end "packer.nvim detected"
fi

if ! test -e ~/.config/coc; then
    symlink ~/.dotfiles/coc ~/.config
    cd ~/.config/coc/extensions && pnpm i
    log_end "coc.nvim config setup"
else
    log_end "coc.nvim config detected"
fi
echo
