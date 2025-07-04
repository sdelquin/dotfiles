# Misc
alias tree="tree -C"
alias ll='lsd -F -l --date relative'
alias lla='lsd -F -la --date relative'
alias g='rg'
alias f='fd'
alias j='just'
alias teach='iterm2_profile Teaching'
alias b='bat -p'
# Git
alias gst='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gca='git commit -am'
alias gp='git push'
alias gpull='git pull'
# Python
alias a='source .venv/bin/activate'
alias d='deactivate'
alias p='clear; ipython'
alias upip='pip install -U pip'
alias serve="python -m http.server"
alias clean_pyc="find . -name '*.pyc' -exec rm {} \;"
alias fpp='pip freeze | grep -i'
alias cdsitepackages='cd $(find . -name site-packages -d)'
alias disable-auto-venv='export DISABLE_AUTO_VENV=1'
alias justdjango='curl -fsSL -o justfile https://raw.githubusercontent.com/sdelquin/justfiles/refs/heads/main/justfile.django'
# uv
alias uva='uv_autoactivate'
# Docker
alias rmdockerexitedcontainers='docker ps -a | perl -nale '\''print $F[0] if /Exited/'\'' | xargs docker rm'
alias rmdockeranonvolumes='docker volume ls | perl -nale '\''print $F[1] if length($F[1]) == 64'\'' | xargs docker volume rm'
alias rmdockerorphanimages='docker images | perl -nale '\''print $F[2] if $F[0] =~ /<none>/'\'' | xargs docker rmi'
alias rmdocker='rmdockerexitedcontainers && rmdockeranonvolumes && rmdockerorphanimages'
# R
alias r='clear; radian'
