#
# Generate the compose override string
#
WHICH_COMPOSE=""

if [[ -f "$PROJECT_CWD/docker-compose.yml" ]]; then
    WHICH_COMPOSE="-f docker-compose.yml"
fi

# handle multiple environments
# production:seeding
IFS=':' read -r -a HUMBLE_ENVS <<< "$HUMBLE_ENV"
for HUMBLE_ENV in "${HUMBLE_ENVS[@]}"; do
    if [[ ! "default" == $HUMBLE_ENV && ! -z $HUMBLE_ENV ]]; then
        EXTEND_COMPOSE="docker-compose.$HUMBLE_ENV.yml"
        if [ ! -f "$PROJECT_CWD/$EXTEND_COMPOSE" ]; then
            echo ""
            echo "=== WARNING ==="
            echo "\"$EXTEND_COMPOSE\" not found!"
            echo ""
            echo ""
            exit 1
        fi
        WHICH_COMPOSE="$WHICH_COMPOSE -f $EXTEND_COMPOSE"
    fi
done

# Compose the `docker-compose` full instruction
COMPOSE_CMD="$DECLARED_ENV_VARS docker-compose $WHICH_COMPOSE"
COMPOSE_EXE="$COMPOSE_CMD $@"

# echo $WHICH_COMPOSE
# echo ""
# echo $COMPOSE_EXE
# exit 0
