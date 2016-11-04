
enterToContinue() {
    MSG=${1:-"Press ENTER to continue, ESC to abort..."}
    read -n1 -r -p "$MSG" key
    if [ "$key" != '' ]; then
        echo ""
        exit 0
    fi
}
