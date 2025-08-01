alias pstree="pstree -g2"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias e="code ."
alias fullpath="python -c 'import os,sys;print(os.path.realpath(sys.argv[1]))'"
alias kstats='sudo killall systemstats'
alias kfinder='sudo killall Finder'
alias kcode='kill -9 `ps aux | grep -i "code helper" | tr -s " " | grep -v grep | cut -d" " -f2 | xargs`'
alias o='open .'
alias mount-medusa="open 'smb://sdelqui@TFQSC501/Usuarios/sdelqui'"
alias iface='/sbin/ifconfig | perl -nle '"'"'print $1 if /inet *(\d+\.\d+\.\d+\.\d+)/'"'"' | grep -v ^127'
alias mserve='serve -b $(iface)'
# https://github.com/pimterry/notes
alias nn="notes new"
alias nf="notes find"
alias ns="notes search"
alias no="notes open"
alias nc="notes cat"  # /usr/local/bin/notes parcheado en L315 (https://n9.cl/89ip3)
alias marked='open -a "Marked 2"'
# Cutting Optimization Pro (via Whisky App)
alias cut-materials='vi "/Users/sdelquin/Library/Containers/com.isaacmarovitz.Whisky/Bottles/74DF8116-2E4C-4535-8B11-2E8D09548484/drive_c/users/crossover/Documents/Optimal Programs/Cutting Optimization pro 5/materials.xml"'
alias cut-stock='vi "/Users/sdelquin/Library/Containers/com.isaacmarovitz.Whisky/Bottles/74DF8116-2E4C-4535-8B11-2E8D09548484/drive_c/users/crossover/Documents/Optimal Programs/Cutting Optimization pro 5/stock2d.xml"'
alias cut-docs='cd "/Users/sdelquin/Library/Containers/com.isaacmarovitz.Whisky/Bottles/74DF8116-2E4C-4535-8B11-2E8D09548484/drive_c/users/crossover/Documents/"'
# PyPI
alias pypi-token='cat ~/.pypirc | grep "\[pypi\]" -A2 | tail -1 | perl -ne '"'"'print $1 if /password *= *(.*)/'"'"''
alias testpypi-token='cat ~/.pypirc | grep "\[testpypi\]" -A2 | tail -1 | perl -ne '"'"'print $1 if /password *= *(.*)/'"'"''
