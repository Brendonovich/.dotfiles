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
