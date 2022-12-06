# copy file contents to clipboard
copy() {
    cat $1 | pbcopy
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
