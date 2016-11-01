#
# Interface to the utility scripts
#

# Utility command to execute
WHICH_UTILITY="$2"

# Execute known commands if they exists
CMD_PATH="$SCRIPT_CWD/utils/$WHICH_UTILITY.sh"
[ -f "$CMD_PATH" ] && source "$CMD_PATH"

# Run scripts from docker-utils image
HUMBLE_EXEC_MODE=$(getContainerRunCmd $(getContainerId humble))
HUMBLE_TARGET_SCRIPT="${2-seed}.sh ${@:3}"
WHICH_CMD="$COMPOSE_CMD $HUMBLE_EXEC_MODE humble /bin/ash /scripts/$HUMBLE_TARGET_SCRIPT"

eval $WHICH_CMD
exit 0
