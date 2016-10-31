#!/bin/bash

SCRIPT_CWD=$(dirname $(readlink -n ${BASH_SOURCE[0]}))
PROJCT_CWD="$PWD"

# Environment variables files
ENV_CONFIG_FNAME=".env"
ENV_LOCAL_FNAME=".env.local"
ENV_OVERRIDE_FNAME=".env.override"

source "$SCRIPT_CWD/inc/check-env.sh"
source "$SCRIPT_CWD/inc/source-env.sh"

echo $WP_MIGRATE_FROM
