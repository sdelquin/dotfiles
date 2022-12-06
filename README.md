# dotfiles

Custom dot files

## Instalación

```console
git clone git@github.com:sdelquin/dotfiles.git ~/.dotfiles
```

## Dependencias transversales

```console
# pyenv
pip install flake8 black
```

## Symlinks transversales

```console
ln -s .dotfiles/common/gitconfig .gitconfig
```

## MacOS

Dependencias:

```console
brew install lsd bat ripgrep delta
```

Symlinks:

```console
ln -s .dotfiles/macos/vimrc .vimrc
```

## Linux

Dependencias externas:

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

Dependencias apt:

```console
sudo apt install -y xclip fonts-noto-color-emoji
```

> 💡 Para que funcione `xclip` necesitamos disponer de un servidor X:

Symlinks:

```console
ln -s .dotfiles/linux/vimrc .vimrc
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

### Sólo para Linux

Habilitar `sudo` para que utilice las mismas configuraciones `vim`:

```console
sudo -- sh -c "ln -sf $HOME/.vimrc /root/.vimrc; ln -sf $HOME/.vim /root/.vim"
```
