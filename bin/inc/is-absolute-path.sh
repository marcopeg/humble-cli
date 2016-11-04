
isAbsolutePath() {
    if [ "${1:0:1}" = "/" ]; then
        echo true
    else
        echo false
    fi
}
