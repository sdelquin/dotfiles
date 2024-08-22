alias i='uv pip install'
alias u='uv pip uninstall'
alias ireq='uv pip install -r requirements.txt'

mkvirtualenv() {
    if [[ $1 ]]; then
        uv venv --seed -p $1
    else
        uv venv --seed
    fi
    [[ $? -eq 0 ]] && source .venv/bin/activate
}
