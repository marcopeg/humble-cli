
fetch() {
    CACHE_FILE=$(mktemp "/tmp/fetch_$(stringifyUrl $PROJECT_CWD)_$(stringifyUrl $1)_$(stringifyUrl $(microseconds)).XXXXXX")
    if [ $(which wget) ] ; then
        wget -O $CACHE_FILE $1 >/dev/null 2>/dev/null
    else
        curl -H 'Cache-Control: no-cache' -L -o $CACHE_FILE $1 >/dev/null 2>/dev/null
    fi
    cat "$CACHE_FILE"
    rm "$CACHE_FILE"
}
