# AÑADIR ESTO AL FINAL DEL FICHERO ~/.zshrc
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
#export DOTFILES=$HOME/.dotfiles
#source $DOTFILES/macos/zshrc.zsh
# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

source $DOTFILES/common/shrc
source $DOTFILES/macos/functions.sh
source $DOTFILES/macos/aliases.sh

# Solución al problema de que salga fondo blanco al pegar texto en consola
# https://news.ycombinator.com/item?id=26757438
zle_highlight+=(paste:none)

# Add brew binaries to the path
eval $(/opt/homebrew/bin/brew shellenv)

export PATH=$PATH:$HOME/bin

ssh-add $HOME/.ssh/id_rsa 2> /dev/null

# brew install bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $DOTFILES/macos/p10k.zsh ]] || source $DOTFILES/macos/p10k.zsh

eval "$(zoxide init --cmd cd zsh)"
