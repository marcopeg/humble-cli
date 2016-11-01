#
# Displays manual pages
#

if [ "help" == "$WHICH_CMD" ]; then

    WHICH_HELP="$2"

    if [ -z "$WHICH_HELP" ]; then
        manPage "$SCRIPT_CWD/man/help.sh"
    else
        manPage $MAN_PAGE "$SCRIPT_CWD/man/$WHICH_HELP.sh"
    fi

    exit 0
fi
