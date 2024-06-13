alias tree="tree -C"
alias ll='lsd -F -l --date relative'
alias lla='lsd -F -la --date relative'
alias bat='bat -p'
alias g='rg'
alias f='fd'
alias j='just'
# Python
alias v='source .venv/bin/activate'
alias p='clear; ipython -i $DOTFILES/common/ipython.py'
alias serve="python -m http.server"
alias clean_pyc="find . -name *.pyc -exec rm {} \;"
alias d='deactivate'
alias upip='pip install -U pip'
# Docker
alias rmdockerexitedcontainers='docker ps -a | perl -nale '\''print $F[0] if /Exited/'\'' | xargs docker rm'
alias rmdockeranonvolumes='docker volume ls | perl -nale '\''print $F[1] if length($F[1]) == 64'\'' | xargs docker volume rm'
alias rmdockerorphanimages='docker images | perl -nale '\''print $F[2] if $F[0] =~ /<none>/'\'' | xargs docker rmi'
alias rmdocker='rmdockerexitedcontainers && rmdockeranonvolumes && rmdockerorphanimages'
