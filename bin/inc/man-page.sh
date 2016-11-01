
manPage () {
    if [ -f "$1" ]; then
        echo ""
        echo ""
        TMP=$(mktemp "/tmp/humble_man_$(stringifyUrl $PWD)_$(stringifyUrl $WHICH_HELP)_$(stringifyUrl $(microseconds)).XXXXXX")
        cat "$1" > "$TMP"
        sed -i -e 's/^/    /' "$TMP"
        cat "$TMP"
        rm "$TMP"
        echo ""
        echo ""
    else
        echo "Man page not found: $WHICH_HELP"
    fi
}
