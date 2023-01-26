# Ref: https://bit.ly/3FdYaV5
list_virtualenvs() {
    COMPREPLY=$(lsvirtualenv)
}

list_python_versions() {
    COMPREPLY=$(lspy)
}

complete -F list_virtualenvs workon
complete -F list_virtualenvs rmvirtualenv
complete -F list_python_versions mkvirtualenv
