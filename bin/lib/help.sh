#
# Displays manual pages
#

if [ "help" == "$WHICH_CMD" ]; then

    WHICH_HELP="$2"

    if [ -z "$WHICH_HELP" ]; then
        source "$SCRIPT_CWD/man/help.sh"
    else
        MAN_PAGE="$SCRIPT_CWD/man/$WHICH_HELP.sh"
        if [ -f "$MAN_PAGE" ]; then
            echo ""
            echo "=== DockerHumble :: $WHICH_HELP ==="
            source $MAN_PAGE
            echo ""
            echo ""
        else
            echo "Man page not found: $WHICH_HELP"
        fi
    fi

    exit 0
fi
