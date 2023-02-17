alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
alias pstree="pstree -g2"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias e="code ."
alias fpath="python -c 'import os,sys;print(os.path.realpath(sys.argv[1]))'"
alias kstats='sudo killall systemstats'
alias kfinder='sudo killall Finder'
alias kcode='kill -9 `ps aux | grep -i "code helper" | tr -s " " | grep -v grep | cut -d" " -f2 | xargs`'
alias o='open .'
alias sync-alu="scp *.JPG hetzner:/usr/share/fotos/alumnado && mv *.JPG procesadas"
alias sync-prof="scp *.JPG hetzner:/usr/share/fotos/profesorado && mv *.JPG procesadas"
alias sync-pas="scp *.JPG hetzner:/usr/share/fotos/pas && mv *.JPG procesadas"
alias mount-medusa="open 'smb://sdelqui@TFQSC501/Usuarios/sdelqui'"
