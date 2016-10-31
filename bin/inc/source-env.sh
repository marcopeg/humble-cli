#
# Source the environment and compute the custom list of variables
# that need to be set to docker-compose
#

( set -o posix ; set ) >/tmp/variables.before

[ -f $ENV_CONFIG ] && source $ENV_CONFIG
[ -f $ENV_LOCAL_CONFIG ] && source $ENV_LOCAL_CONFIG
[ -f $ENV_OVERRIDE_CONFIG ] && source $ENV_OVERRIDE_CONFIG

( set -o posix ; set ) >/tmp/variables.after

SOURCED_VARS=$(diff /tmp/variables.before /tmp/variables.after | sed -ne 's/^> //p')
rm /tmp/variables.before /tmp/variables.after

ENV_VARS=""
for VAR in $SOURCED_VARS; do
    ENV_VARS="$ENV_VARS $VAR"
done

echo $ENV_VARS
