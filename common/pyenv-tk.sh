alias lsvirtualenv='ls ~/.pyenv/versions | grep -vE "^[[:digit:]]+" | sort'
alias lspy='pyenv versions | perl -lne "/(\d+.\d+.\d+)/ && print \$1;" | sort -t. -k1,1 -k2,2 -k3,3 -u -n'

# Shortcut to create virtualenvs with pyenv
# ARGUMENT! -> version of Python to use inside the virtualenv
# Example: $ mkvirtualenv 3.11.0
mkvirtualenv() {
    venv=$(basename "$PWD")
    pyenv virtualenv $@ $venv
    source ~/.pyenv/versions/$venv/bin/activate
    pip install -U pip
    deactivate
    echo $venv > .python-version
}

# Shortcut to remove virtualenvs with pyenv
rmvirtualenv() {
    #pyenv uninstall $@
    pyenv virtualenv-delete $@
}

# Activate virtualenv
workon() {
    project_name=$@
    source "$HOME/.pyenv/versions/$project_name/bin/activate"
    m
}

# CD to project directory based on current active virtualenv
m() {
    project_name=$(basename "$VIRTUAL_ENV")
    project_dir=$(find ~/code -maxdepth 2 -type d | grep $project_name | head -1)
    if [ -d "$project_dir" ]; then
        cd $project_dir
    fi
}

# activate virtualenv depending on PWD (and parents)
s() {
    dir=$PWD
    while [ $dir != '/' ]
    do
        project=$(basename $dir)
        venv="$HOME/.pyenv/versions/$project/bin/activate"
        if test -f "$venv"; then
            source "$venv"
            break
        fi
        dir=$(dirname $dir)
    done
}
