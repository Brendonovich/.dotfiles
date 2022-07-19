export DOT=~/.dotfiles

export NVIM_INIT=$DOT/nvim/lua/brendonovich/init.lua
export ZSHRC=$DOT/.zshrc
export BREWFILE=$DOT/Brewfile

export GIT_EDITOR=nvim

eval "$(starship init zsh)"

eval "$(fnm env --use-on-cd)"
