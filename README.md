# dotfiles <!-- omit from toc -->

- [Instalación](#instalación)
- [Común](#común)
- [MacOS](#macos)
  - [Dependencias](#dependencias)
  - [Symlinks](#symlinks)
- [Linux](#linux)
  - [Dependencias](#dependencias-1)
  - [Symlinks](#symlinks-1)
- [Vim](#vim)

Custom dot files

## Instalación

```console
git clone git@github.com:sdelquin/dotfiles.git ~/.dotfiles
```

## Común

### Dependencias <!-- omit from toc -->

```console
pyenv
pip install flake8 mypy black
```

### Symlinks <!-- omit from toc -->

```console
ln -s ~/.dotfiles/common/gitconfig .gitconfig
ln -s ~/.dotfiles/common/flake8 .flake8
ln -s ~/.dotfiles/common/mypy.ini .mypy.ini
ln -s ~/.dotfiles/common/black .config/black
```

## MacOS

### Dependencias

```console
brew install lsd bat ripgrep delta zoxide
```

### Symlinks

```console
ln -s ~/.dotfiles/macos/vimrc .vimrc
```

Añadir al final del fichero `~/.zshrc`:

```bash
export DOTFILES=$HOME/.dotfiles
source $DOTFILES/macos/zshrc.zsh
```

## Linux

### Dependencias

```console
curl -LO https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb

curl -LO https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-musl_0.22.1_amd64.deb
sudo dpkg -i bat-musl_0.22.1_amd64.deb

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

curl -LO https://github.com/dandavison/delta/releases/download/0.15.1/git-delta-musl_0.15.1_amd64.deb
sudo dpkg -i git-delta-musl_0.15.1_amd64.deb
```

Para usar la función `copy()` necesitamos instalar la [Shell Integration de iTerm2](https://iterm2.com/documentation-utilities.html). En otro caso se puede usar la función `xcopy()` que hace uso de `xclip`.

```console
sudo apt install -y xclip fonts-noto-color-emoji
```

> 💡 Para que funcione `xclip` necesitamos disponer de un servidor X

### Symlinks

```console
ln -s ~/.dotfiles/linux/vimrc .vimrc
```

Añadir al final del fichero `~/.bashrc`:

```bash
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
