# Ref: https://bit.ly/3FdYaV5
list_virtualenvs() {
    COMPREPLY=$(lsvirtualenv)
}

list_python_versions() {
    COMPREPLY=$(lspy)
}

list_just_targets() {
    COMPREPLY=$(just -l | tail -n +1 | perl -nle 'print $1 if /^\s+(\S+)/')
}

complete -F list_virtualenvs workon
complete -F list_virtualenvs rmvirtualenv
complete -F list_python_versions mkvirtualenv
complete -F list_just_targets just
