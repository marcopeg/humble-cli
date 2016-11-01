#!/bin/bash

SCRIPT_CWD=$(dirname $(readlink -n ${BASH_SOURCE[0]}))
PROJECT_CWD="$PWD"

# Environment variables files
ENV_CONFIG_FNAME=".env"
ENV_LOCAL_FNAME=".env.local"
ENV_OVERRIDE_FNAME=".env.override"

# Libraries
source "$SCRIPT_CWD/inc/microseconds.sh"
source "$SCRIPT_CWD/inc/hash.sh"
source "$SCRIPT_CWD/inc/stringify-url.sh"

# Steps
source "$SCRIPT_CWD/lib/check-env.sh"
source "$SCRIPT_CWD/lib/source-env.sh"
source "$SCRIPT_CWD/lib/default-env.sh"
source "$SCRIPT_CWD/lib/which-compose.sh"
source "$SCRIPT_CWD/lib/which-cmd.sh"
source "$SCRIPT_CWD/lib/help.sh"

eval $COMPOSE_EXE
