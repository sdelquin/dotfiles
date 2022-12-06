# https://gist.github.com/premek/6e70446cfc913d3c929d7cdbfe896fef
mv() {
  if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
    command mv "$@"
    return
  fi

  newfilename=$1
  vared -p "🔀 " newfilename  # adapted to zsh via https://stackoverflow.com/a/53543070
  command mv -v -- "$1" "$newfilename"
}
