#
# Validates given command
#

WHICH_CMD="$1"
if [ -z "$WHICH_CMD" ]; then
    WHICH_CMD="help"
fi
