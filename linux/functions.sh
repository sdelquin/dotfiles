take() {
    dir=$@
    mkdir -p $dir && cd $dir
}

# Dependencia: https://iterm2.com/documentation-utilities.html
copy() {
    if [ -z $@ ];
    then
        it2copy
    else
        it2copy < $@
    fi
}

xcopy() {
    if [ -z $@ ];
    then
        xclip -sel c
    else
        xclip -sel c < $@
    fi
}

copypath() {
    pwd | it2copy 
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

