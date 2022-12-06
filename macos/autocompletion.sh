# Ref: https://bit.ly/3FdYaV5
list_virtualenvs() {
    COMPREPLY=$(lsvirtualenv)
}

complete -F list_virtualenvs workon
complete -F list_virtualenvs rmvirtualenv
