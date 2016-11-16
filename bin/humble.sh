#!/bin/bash

SCRIPT_CWD=$(dirname $(readlink -n ${BASH_SOURCE[0]}))
PROJECT_CWD="$PWD"

# Environment variables files
ENV_CONFIG_FNAME=".env"
ENV_LOCAL_CONFIG_FNAME=".env.local"
ENV_OVERRIDE_CONFIG_FNAME=".env.override"

# Image dependency declaration
HUMBLE_UTILS="marcopeg/humble-utils:1.0.1"
HUMBLE_SERVER="marcopeg/humble-server:1.0.1"

# Libraries
source "$SCRIPT_CWD/inc/index-of.sh"
source "$SCRIPT_CWD/inc/microseconds.sh"
source "$SCRIPT_CWD/inc/hash.sh"
source "$SCRIPT_CWD/inc/stringify-url.sh"
source "$SCRIPT_CWD/inc/man-page.sh"
source "$SCRIPT_CWD/inc/fetch.sh"
source "$SCRIPT_CWD/inc/enter-to-continue.sh"
source "$SCRIPT_CWD/inc/is-absolute-path.sh"
source "$SCRIPT_CWD/inc/service-url.sh"
source "$SCRIPT_CWD/inc/is-tar-gz-path.sh"

# Boot steps
source "$SCRIPT_CWD/lib/check-env.sh"
source "$SCRIPT_CWD/lib/source-env.sh"
source "$SCRIPT_CWD/lib/default-env.sh"
source "$SCRIPT_CWD/lib/which-compose.sh"
source "$SCRIPT_CWD/lib/which-cmd.sh"
source "$SCRIPT_CWD/lib/utils-globals.sh"

# Execute known commands if they exists
CMD_PATH="$SCRIPT_CWD/cmd/$WHICH_CMD.sh"
[ -f "$CMD_PATH" ] && source "$CMD_PATH"

# Execute high level scripts from the application
# (this may be improved a lot :-)
COMPOSE_RESERVED_CMD="build,bundle,config,create,down,events,exec,help,kill,logs,pause,port,ps,pull,push,restart,rm,run,scale,start,stop,unpause,up,version"
CMD_PATH="$PROJECT_CWD/scripts/$1.sh"
if [ -f "$CMD_PATH" ]; then
    if [ $(indexOf  "$COMPOSE_RESERVED_CMD" "$1") = "-1" ]; then
        source "$CMD_PATH"
        exit 0
    else
        echo "WARNING: app script not allowed as it is a docker-compose command!"
        echo "(keep running as docker-compose command)"
        enterToContinue
    fi
fi

# Proxy to docker-compose
eval $COMPOSE_EXE
