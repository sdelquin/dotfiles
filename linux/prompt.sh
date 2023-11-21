RUNNING_SYMBOL='✨'
VIRTUALENV_SYMBOL='»'

parse_git_branch() {
    branch=$(git branch 2> /dev/null | sed -e 's/* \(.*\)/\1/')
    [[ ! -z "$branch" ]] && echo " $branch"
}

parse_virtualenv() {
    if [[ "${VIRTUAL_ENV}" ]]; then
        venv_cfg=$VIRTUAL_ENV/pyvenv.cfg
        if [[ -f "$venv_cfg" ]]; then
            virtualenv=$(perl -ne 'print $1 if /^prompt *= *\x27(.*)\x27$/' $venv_cfg)
        fi
        if [[ -z $virtualenv ]]; then
            virtualenv=$(basename $VIRTUAL_ENV)
        fi
        echo "[$VIRTUALENV_SYMBOL $virtualenv] "
    fi
}

check_git_changes() {
    if [[ `git status --porcelain 2> /dev/null` ]]; then
        echo '⚡'
    fi
}

export PS1="$RUNNING_SYMBOL\[\033[01;32m\]\$(parse_virtualenv)\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]\$(parse_git_branch)\[\033[01;33m\]\$(check_git_changes)\[\e[00m\]$ "
