# Ref: https://bit.ly/3FdYaV5
list_virtualenvs() {
    COMPREPLY=($(compgen -W "$(lsvirtualenv)" "${COMP_WORDS[1]}"))
}

list_python_versions() {
    COMPREPLY=($(compgen -W "$(lspy)" "${COMP_WORDS[1]}"))
}

complete -F list_virtualenvs workon
complete -F list_virtualenvs rmvirtualenv
complete -F list_python_versions mkvirtualenv
