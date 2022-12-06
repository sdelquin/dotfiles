RUNNING_SYMBOL='✨'

parse_git_branch() {
    branch=$(git branch 2> /dev/null | sed -e 's/* \(.*\)/\1/')
    [[ ! -z "$branch" ]] && echo " $branch"
}

parse_virtualenv() {
    if [[ ! -z "${VIRTUAL_ENV}" ]]; then
        virtualenv=$(basename $VIRTUAL_ENV)
        echo "[⧩ $virtualenv] "
    fi
}

check_git_changes() {
    if [ -d .git ] && [[ `git status --porcelain` ]]; then
        echo '⚡'
    fi
}

export PS1="$RUNNING_SYMBOL\[\033[01;35m\]\$(parse_virtualenv)\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]\$(parse_git_branch)\[\033[01;33m\]\$(check_git_changes)\[\e[00m\]$ "
