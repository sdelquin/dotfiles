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

function fpp () {
    # Find a python package within all pyenv versions
    ls -d $HOME/.pyenv/versions/*/lib/*/site-packages/* | grep -iE "$1$"
}
