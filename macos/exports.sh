# Quitar mensaje de Docker
# https://bit.ly/49NvT5I
export DOCKER_CLI_HINTS=false
# brew install bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/magic-enter
MAGIC_ENTER_GIT_COMMAND='ll'
MAGIC_ENTER_OTHER_COMMAND='ll'
# PATH
export PATH=$PATH:$HOMEBREW_PREFIX/opt/python@3.12/libexec/bin:$HOME/bin
