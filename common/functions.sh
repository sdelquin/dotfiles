function addreq () {
    if grep -iq $1 requirements.txt; then
        echo \"$1\" already exists in requirements.txt
    else
        pip install $1
        pin=$(pip freeze | grep -i $1)
        echo Adding \"$pin\" to requirements.txt
        echo $pin >> requirements.txt
    fi
}

function cd() {
    # https://stackoverflow.com/a/50830617

    # check if zxoide is installed
    if ! [ -x "$(command -v __zoxide_z)" ]; then
        __zoxide_z "$@"
    else
        builtin cd "$@"
    fi

    if [[ -z "$VIRTUAL_ENV" ]] ; then
        ## If env folder is found then activate the vitualenv
        if [[ -d ./.venv ]] ; then
            source ./.venv/bin/activate
            [[ "$(command -v uv)" ]] && alias pip='uv pip'
        fi
    else
        ## check the current folder belong to earlier VIRTUAL_ENV folder
        # if yes then do nothing
        # else deactivate
        parentdir="$(dirname "$VIRTUAL_ENV")"
        if [[ "$PWD"/ != "$parentdir"/* ]] ; then
            unalias pip >/dev/null 2>/dev/null
            deactivate
        fi
    fi
}
