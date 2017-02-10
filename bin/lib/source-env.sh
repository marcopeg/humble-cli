#
# Source the environment and compute the custom list of variables
# that need to be set to docker-compose
#

SOURCE_ENV_TMP1=$(mktemp "/tmp/humble_env_before_$(stringifyUrl $PWD)_$(stringifyUrl $(microseconds)).XXXXXX")
SOURCE_ENV_TMP2=$(mktemp "/tmp/humble_env_after_$(stringifyUrl $PWD)_$(stringifyUrl $(microseconds)).XXXXXX")

if [ -z "$HUMBLE_HOST_IP" ]; then
    HUMBLE_HOST_IP=$(getHostIp)
fi

# Detect enforced environment
if [ ! -z "$HUMBLE_ENV" ]; then
    HUMBLE_FORCED_ENV="$HUMBLE_ENV"
fi

( set -o posix ; set ) >"$SOURCE_ENV_TMP1"

[ -f $ENV_CONFIG ] && source $ENV_CONFIG
[ -f $ENV_LOCAL_CONFIG ] && source $ENV_LOCAL_CONFIG
[ -f $ENV_OVERRIDE_CONFIG ] && source $ENV_OVERRIDE_CONFIG

( set -o posix ; set ) >"$SOURCE_ENV_TMP2"

# Apply enforced environment
if [ ! -z "$HUMBLE_FORCED_ENV" ]; then
    HUMBLE_ENV="$HUMBLE_FORCED_ENV"
fi

SOURCED_VARS=$(diff $SOURCE_ENV_TMP1 $SOURCE_ENV_TMP2 | sed -ne 's/^> //p')
rm "$SOURCE_ENV_TMP1" "$SOURCE_ENV_TMP2"

DECLARED_ENV_VARS=""
for VAR in $SOURCED_VARS; do
    DECLARED_ENV_VARS="$DECLARED_ENV_VARS $VAR"
done
