
WHICH_SERVER_CMD="$2"

# Find out the real server CWD
SERVER_CWD="$PROJECT_CWD"
SERVER_NODE_APP="$SCRIPT_CWD/../humble-node-server"

function runServerScript() {
    echo $(docker run --rm \
        -v "$SERVER_CWD":/humble-server \
        "$HUMBLE_SERVER" \
        node $@)
}

function enabledApps() {
    runServerScript enabled-apps.js
}

function runningApps() {
    runServerScript running-apps.js
}

# Execute known server commands if they exists
SERVER_CMD_PATH="$SCRIPT_CWD/server/$WHICH_SERVER_CMD.sh"
[ -f "$SERVER_CMD_PATH" ] && source "$SERVER_CMD_PATH"
