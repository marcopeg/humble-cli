
isOsx() {
    if [ "Darwin" = $(uname -s) ]; then
        echo "yes"
    else
        echo "no"
    fi
}
