#!/bin/bash

mkdir -p ~/.config/mypy
mkdir -p ~/.ipython/profile_default

# prompt
ln -s ~/.dotfiles/common/starship.toml ~/.config/starship.toml

# misc
ln -s ~/.dotfiles/common/vimrc ~/.vimrc
ln -s ~/.dotfiles/common/latexmkrc ~/.latexmkrc
ln -s ~/.dotfiles/common/gitconfig ~/.gitconfig

# python tools
ln -s ~/.dotfiles/common/ruff.toml ~/.config/ruff.toml
ln -s ~/.dotfiles/common/mypy.ini ~/.config/mypy/config
ln -s ~/.dotfiles/common/ipython.py ~/.ipython/profile_default/ipython_config.py
ln -s ~/.dotfiles/common/radian ~/.radian_profile
