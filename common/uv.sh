uvi() {
    DEV_DEPS=(ipython pytest)
    if [[ $1 ]]; then
        uv init --bare --no-workspace -p $1
        uv add --dev "${DEV_DEPS[@]}" -p $1
    else
        uv init --bare --no-workspace
        uv add --dev "${DEV_DEPS[@]}"
    fi
    echo '\nprod = []' >> pyproject.toml
    uva  # "activate" uv environment
}

mkvirtualenv() {
    if [[ $1 ]]; then
        uv venv --seed -p $1
    else
        uv venv --seed
    fi
    [[ $? -eq 0 ]] && source .venv/bin/activate
}

pi() {
    REQFILE="requirements.txt"
    [ ! -f $REQFILE ] && touch $REQFILE
    for package in $@; do
        uv pip install $package
        package_qual=`uv pip freeze | grep $package==`
        package_name=`echo $package_qual | perl -ne 'print $1 if /(.*)==.*/'`
        package_version=`echo $package_qual | perl -ne 'print $1 if /.*==(.*)/'`
        if grep -q $package_name $REQFILE; then
            perl -i -pe "s/^$package_name==.*$/$package_qual/" $REQFILE
        else
            echo $package_qual >> $REQFILE
        fi
    done
    sort $REQFILE -o $REQFILE
    echo Updated $REQFILE
}

pu() {
    REQFILE="requirements.txt"
    for package in $@; do
        uv pip uninstall $package
        if [ -f $REQFILE ] && grep -q $package $REQFILE; then
            perl -i -ne "print unless /^$package==.*$/" $REQFILE
            echo Updated $REQFILE
        fi
    done
}
