#
# Execute a project's script
#

SCRIPT_NAME=$2
SCRIPT_PATH="$PROJECT_CWD/scripts/$SCRIPT_NAME.sh"
if [ -f $SCRIPT_PATH ]; then
    ARGS=${@:3}
    source $SCRIPT_PATH
    exit 0
else
    echo "Script does not exist"
    exit 1
fi
