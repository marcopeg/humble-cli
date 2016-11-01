
manPage () {
    if [ -f "$1" ]; then
        echo ""
        echo "============================"
        echo "=== DOCKER HUMBLE MANUAL ==="
        echo "============================"
        echo ""
        source $1
        echo ""
        echo ""
        echo ""
    else
        echo "Man page not found: $WHICH_HELP"
    fi
}
