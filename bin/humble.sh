#!/bin/bash

SCRIPT_CWD=$(dirname $(readlink -n ${BASH_SOURCE[0]}))
PROJECT_CWD="$PWD"

# Environment variables files
ENV_CONFIG_FNAME=".env"
ENV_LOCAL_CONFIG_FNAME=".env.local"
ENV_OVERRIDE_CONFIG_FNAME=".env.override"

# Libraries
source "$SCRIPT_CWD/inc/index-of.sh"
source "$SCRIPT_CWD/inc/microseconds.sh"
source "$SCRIPT_CWD/inc/hash.sh"
source "$SCRIPT_CWD/inc/stringify-url.sh"
source "$SCRIPT_CWD/inc/man-page.sh"
source "$SCRIPT_CWD/inc/fetch.sh"
source "$SCRIPT_CWD/inc/enter-to-continue.sh"

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

# Proxy to docker-compose
eval $COMPOSE_EXE
