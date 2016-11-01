#
# Validates the list of environment files and prompt a message
# if there is no environment information.
#

ENV_CONFIG="$PROJECT_CWD/$ENV_CONFIG_FNAME"
ENV_LOCAL_CONFIG="$PROJECT_CWD/$ENV_LOCAL_CONFIG_FNAME"
ENV_OVERRIDE_CONFIG="$PROJECT_CWD/$ENV_OVERRIDE_CONFIG_FNAME"

# Validate environment
ENV_EXISTS=false
[ -f $ENV_CONFIG ] && ENV_EXISTS=true
[ -f $ENV_LOCAL_CONFIG ] && ENV_EXISTS=true
[ -f $ENV_OVERRIDE_CONFIG ] && ENV_EXISTS=true

if [ "$ENV_EXISTS" == "false" ]; then
    echo ""
    echo "=== WARNING ==="
    echo "\"$ENV_CONFIG\" not found"
    echo "switch to default values, you may experience some troubles..."
    echo ""
    echo ""
    sleep 2
fi
