mkvirtualenv() {
    if [[ $1 ]]; then
        uv venv --seed -p $1
    else
        uv venv --seed
    fi
    [[ $? -eq 0 ]] && source .venv/bin/activate
}
