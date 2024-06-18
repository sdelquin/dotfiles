function addreq () {
    pip install $1
    pin=$(pip freeze | grep -i $1)
    echo Adding "$pin" to requirements.txt
    echo $pin >> requirements.txt
}
