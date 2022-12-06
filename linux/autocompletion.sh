# Ref: https://bit.ly/3FdYaV5
list_virtualenvs() {
    COMPREPLY=($(compgen -W "$(lsvirtualenv)" "${COMP_WORDS[1]}"))
}

complete -F list_virtualenvs workon
complete -F list_virtualenvs rmvirtualenv
