export ZSH="$HOME/.dotfiles/ohmyzsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export DOT=$HOME/.dotfiles
export CONFIG=$HOME/.config

export NVIM_INIT=$DOT/nvim/lua/brendonovich/init.lua
export NVIM_LUA=$DOT/nvim/lua/brendonovich
export ZSHRC=$DOT/.zshrc
export BREWFILE=$DOT/Brewfile
export GH=~/github.com
export MYGH=$GH/brendonovich
export SDGH=$GH/spacedriveapp

export GIT_EDITOR=nvim

export STARSHIP_CONFIG=$DOT/starship.toml
eval "$(starship init zsh)"

eval "$(fnm env --use-on-cd)"

function ghclone {
    gh repo clone $1 ~/github.com/$1
}

function gh.com {
	open https://github.com/$1
}

function brewdle {
	brew bundle --file $BREWFILE
}

alias nvim=lvim

export PNPM_HOME=$HOME/Library/pnpm
export PATH="$PNPM_HOME:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$HOME/.local/bin:$PATH"

export EDITOR=nvim

# pnpm
export PNPM_HOME="/Users/brendonovich/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# source /Users/brendonovich/.docker/init-zsh.sh || true # Added by Docker Desktop

alias cpg="cargo prisma generate"
alias lg="lazygit"
