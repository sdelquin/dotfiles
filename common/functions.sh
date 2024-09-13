cd() {
    # https://stackoverflow.com/a/50830617
    #
    # check if zxoide is installed
    if ! [ -x "$(command -v __zoxide_z)" ]; then
        __zoxide_z "$@"
    else
        builtin cd "$@"
    fi

    venv_autoactivate
}

venv_autoactivate() {
    # https://github.com/pypa/virtualenv/issues/554#issuecomment-35713201
    # https://stackoverflow.com/a/50830617
    if [[ -z "$VIRTUAL_ENV" ]] ; then
        dir=`pwd`
        while [[ ! -f $dir/.venv/bin/activate && -n $dir ]]; do
            dir=${dir%/*}
        done
        if [[ -f $dir/.venv/bin/activate ]]; then
            #echo "Activating virtualenv from $dir/venv"
            source $dir/.venv/bin/activate
        #else
            #echo 'Virtualenv not found'
        fi
    else
        ## check the current folder belong to earlier VIRTUAL_ENV folder
        # if yes then do nothing
        # else deactivate
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]] ; then
            deactivate
            venv_autoactivate  # maybe we jumped into a new virtualenv!
        fi
    fi
}
