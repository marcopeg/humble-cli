#
# Validates the list of environment files and prompt a message
# if there is no environment information.
#

ENV_CONFIG="$PROJCT_CWD/$ENV_CONFIG_FNAME"
ENV_LOCAL_CONFIG="$PROJCT_CWD/$ENV_LOCAL_CONFIG_FNAME"
ENV_OVERRIDE_CONFIG="$PROJCT_CWD/$ENV_OVERRIDE_CONFIG_FNAME"

# Validate environment
ENV_IS_VALID=false
[ -f $ENV_CONFIG ] && ENV_IS_VALID=true
[ -f $ENV_LOCAL_CONFIG ] && ENV_IS_VALID=true
[ -f $ENV_OVERRIDE_CONFIG ] && ENV_IS_VALID=true

if [ "$ENV_IS_VALID" == "false" ]; then
    echo ""
    echo "=== WARNING ==="
    echo "\"$ENV_CONFIG\" not found"
    echo "switch to default values, you may experience some troubles..."
    echo ""
    echo ""
    sleep 2
fi
