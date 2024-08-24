# dotfiles <!-- omit from toc -->

- [Instalación](#instalación)
- [Común](#común)
- [🍎 MacOS](#-macos)
  - [Dependencias](#dependencias)
  - [Symlinks](#symlinks)
  - [Starship](#starship)
  - [`.zshrc`](#zshrc)
- [🐧 Linux](#-linux)
  - [Dependencias](#dependencias-1)
  - [Symlinks](#symlinks-1)
  - [`.bashrc`](#bashrc)
- [Vim](#vim)

Custom dot files

## Instalación

```console
git clone git@github.com:sdelquin/dotfiles.git ~/.dotfiles
```

## Común

### Dependencias <!-- omit from toc -->

```console
pipx install flake8 mypy black
```

### Symlinks <!-- omit from toc -->

```console
ln -s ~/.dotfiles/common/vimrc ~/.vimrc
ln -s ~/.dotfiles/common/latexmkrc ~/.latexmkrc
ln -s ~/.dotfiles/common/gitconfig ~/.gitconfig

ln -s ~/.dotfiles/common/flake8 ~/.config/flake8
ln -s ~/.dotfiles/common/black ~/.config/black
ln -s ~/.dotfiles/common/ruff.toml ~/.config/ruff.toml
ln -s ~/.dotfiles/common/starship.toml ~/.config/starship.toml

ln -s ~/.dotfiles/common/mypy.ini ~/.config/mypy/config
```

## 🍎 MacOS

### Dependencias

```console
brew install lsd bat ripgrep delta zoxide starship
```

### Symlinks

```console
ln -sf ~/.dotfiles/macos/espanso.yml "/Users/sdelquin/Library/Application Support/espanso/match/base.yml"
```

### Starship

Con [starship](<[https://](https://starship.rs/)>) personalizamos el _prompt_ de línea de comandos. Dado que zsh ...

### `.zshrc`

Para que funcione correctamente el prompt con [starship](https://starship.rs/) es necesario desactivar [powerlevel10k](https://github.com/romkatv/powerlevel10k) ya que viene por defecto en la instalación de `zsh` para MacOS.

Buscamos las siguientes líneas en el fichero `~/.zshrc` y las comentamos:

```console
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# ...

#ZSH_THEME="powerlevel10k/powerlevel10k"
```

Para cargar correctamente las configuraciones propias de MacOS, hay que añadir al final del fichero `~/.zshrc`:

```bash
# CUSTOM ZONE ======================================================
export DOTFILES=$HOME/.dotfiles
source $DOTFILES/macos/zshrc
```

## 🐧 Linux

### Dependencias

```console
# lsd
curl -LO https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb

# bat
curl -LO https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-musl_0.22.1_amd64.deb
sudo dpkg -i bat-musl_0.22.1_amd64.deb

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# delta
curl -LO https://github.com/dandavison/delta/releases/download/0.15.1/git-delta-musl_0.15.1_amd64.deb
sudo dpkg -i git-delta-musl_0.15.1_amd64.deb

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# starship
curl -sS https://starship.rs/install.sh | sh
```

Para usar la función `copy()` necesitamos instalar la [Shell Integration de iTerm2](https://iterm2.com/documentation-utilities.html). En otro caso se puede usar la función `xcopy()` que hace uso de `xclip`.

```console
sudo apt install -y xclip fonts-noto-color-emoji
```

> 💡 Para que funcione `xclip` necesitamos disponer de un servidor X

### Symlinks

```console
# void
```

### `.bashrc`

Para cargar correctamente las configuraciones propias de Linux, hay que añadir al final del fichero `~/.bashrc`:

```bash
# CUSTOM ZONE ======================================================
export DOTFILES=$HOME/.dotfiles
source $DOTFILES/linux/bashrc
```

## Vim

Instalar el gestor de paquetes **vim plug**:

```console
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Instalar los plugins:

```console
vi +'PlugInstall --sync' +qa
```

### Sólo para Linux <!-- omit from toc -->

Habilitar `sudo` para que utilice las mismas configuraciones `vim`:

```console
sudo -- sh -c "ln -sf $HOME/.vimrc /root/.vimrc; ln -sf $HOME/.vim /root/.vim"
```
