
isTarGzPath() {
    if [[ $1 =~ \.tar\.gz$ ]]; then
        echo true
    else
        echo false
    fi
}
