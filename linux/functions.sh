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

# https://gist.github.com/premek/6e70446cfc913d3c929d7cdbfe896fef
mv() {
  if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
    command mv "$@"
    return
  fi

  read -e -p"🔀 " -i $1 newfilename
  command mv -v -- "$1" "$newfilename"
}

