take() {
    dir=$@
    mkdir -p $dir && cd $dir
}

copy() {
    if [ -z $@ ];
    then
        xclip -sel c
    else
        xclip -sel c < $@
    fi
}
