source $DOTFILES/common/aliases.sh

alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias d="cd ~/Desktop"
alias e="code ."
alias fpath="python -c 'import os,sys;print(os.path.realpath(sys.argv[1]))'"
alias py="source ~/.pyenv/versions/sandbox/bin/activate && p && deactivate"
alias kstats='sudo killall systemstats'
alias kfinder='sudo killall Finder'
alias o='open .'
alias sync-alu="scp *.JPG hetzner:/usr/share/fotos/alumnado && mv *.JPG procesadas"
alias sync-prof="scp *.JPG hetzner:/usr/share/fotos/profesorado && mv *.JPG procesadas"
alias sync-pas="scp *.JPG hetzner:/usr/share/fotos/pas && mv *.JPG procesadas"
alias mount-medusa="open 'smb://sdelqui@TFQSC501/Usuarios/sdelqui'"
alias apycheck='source ~/bin/activate-pycheck.sh'
