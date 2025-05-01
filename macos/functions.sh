# copy file contents to clipboard
copy() {
    cat $1 | pbcopy
}

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

# init a R project based on the PWD name
rinit() {
    DIR=${PWD##*/}
    echo 'Version: 1.0

RestoreWorkspace: Default
SaveWorkspace: Default
AlwaysSaveHistory: Default

EnableCodeIndexing: Yes
UseSpacesForTab: Yes
NumSpacesForTab: 2
Encoding: UTF-8

RnwWeave: Sweave
LaTeX: pdfLaTeX' > $DIR.Rproj
}

share() {
    url=$(curl -s --upload-file $1 https://transfer.sh)
    echo $url | pbcopy
    echo "Shared from $url (copied to clipboard)"
    echo "Download it with: curl -O $url"
}

# https://github.com/pimterry/notes
ng () {
    rg -i $1 $NOTES_DIRECTORY    
}
