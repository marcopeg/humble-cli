#
# Displays manual pages
#

if [ "help" == "$WHICH_CMD" ]; then

    WHICH_HELP="$2"

    if [ -z "$WHICH_HELP" ]; then
        manPage "$SCRIPT_CWD/man/help.txt"
    else
        manPage $MAN_PAGE "$SCRIPT_CWD/man/$WHICH_HELP.txt"
    fi

    exit 0
fi
