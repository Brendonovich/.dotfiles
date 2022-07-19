export DOT=~/.dotfiles

export NVIM_INIT=$DOT/nvim/init.vim
export ZSHRC=$DOT/.zshrc
export BREWFILE=$DOT/Brewfile

eval "$(starship init zsh)"

eval "$(fnm env --use-on-cd)"
