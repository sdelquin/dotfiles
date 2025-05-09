# dotfiles <!-- omit from toc -->

**CUSTOM DOT FILES**

- [Instalación](#instalación)
- [Común](#común)
- [🍎 MacOS](#-macos)
  - [Dependencias](#dependencias)
  - [Symlinks](#symlinks)
- [🐧 Linux](#-linux)
  - [Dependencias](#dependencias-1)
  - [Symlinks](#symlinks-1)
- [Vim](#vim)

## Instalación

```bash
git clone git@github.com:sdelquin/dotfiles.git ~/.dotfiles
```

<!-- prettier-ignore -->
> [!NOTE]
> `sudo apt-get install -y git` si no tienes `git` instalado.

## Común

### Dependencias <!-- omit from toc -->

```bash
for tool in ruff mypy ipython radian; do
  uv tool install $tool
done
```

<!-- prettier-ignore -->
> [!NOTE]
> `curl -LsSf https://astral.sh/uv/install.sh | sh` si no tienes `uv` instalado.

### Symlinks <!-- omit from toc -->

Los «symlinks» se pueden crear de forma automática ejecutando el script [`symlinks.sh`](symlinks.sh):

```bash
./symlinks.sh
```

## 🍎 MacOS

### Dependencias

```bash
brew install lsd bat ripgrep fd delta zoxide starship
```

### Symlinks

```bash
ln -sf ~/.dotfiles/macos/zshrc ~/.zshrc

ln -sf ~/.dotfiles/macos/espanso.yml "/Users/sdelquin/Library/Application Support/espanso/match/base.yml"
```

## 🐧 Linux

### Dependencias

> [!CAUTION]
> Buscar las últimas versiones de cada paquete en sus respectivas páginas de GitHub.

```bash
# lsd
curl -LO https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb

# bat
curl -LO https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-musl_0.22.1_amd64.deb
sudo dpkg -i bat-musl_0.22.1_amd64.deb

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# fd
curl -LO https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-musl_10.2.0_amd64.deb
sudo dkpg -i fd-musl_10.2.0_amd64.deb

# delta
curl -LO https://github.com/dandavison/delta/releases/download/0.15.1/git-delta-musl_0.15.1_amd64.deb
sudo dpkg -i git-delta-musl_0.15.1_amd64.deb

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# starship
curl -sS https://starship.rs/install.sh | sh
```

Para usar la función `copy()` necesitamos instalar la [Shell Integration de iTerm2](https://iterm2.com/documentation-utilities.html). En otro caso se puede usar la función `xcopy()` que hace uso de `xclip`.

```bash
sudo apt install -y xclip fonts-noto-color-emoji
```

> [!NOTE]
> Para que funcione `xclip` necesitamos disponer de un servidor X

### Symlinks

```bash
ln -sf ~/.dotfiles/linux/bashrc ~/.bashrc
```

## Vim

Instalar el gestor de paquetes **vim plug**:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Instalar los plugins:

```bash
vi +'PlugInstall --sync' +qa
```

> [!CAUTION]
> Es posible que aparezca el siguiente error (pero no es crítico):
>
> ```bash
> Error detected while processing /home/sdelquin/.vimrc:
> line  143:
> E185: Cannot find color scheme 'PaperColor'
> Press ENTER or type command to continue
> ```

### Sólo para Linux <!-- omit from toc -->

Habilitar `sudo` para que utilice las mismas configuraciones `vim`:

```bash
sudo -- sh -c "ln -sf $HOME/.vimrc /root/.vimrc; ln -sf $HOME/.vim /root/.vim"
```
