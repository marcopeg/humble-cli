#
# Source the environment and compute the custom list of variables
# that need to be set to docker-compose
#

[ -f $ENV_CONFIG ] && source $ENV_CONFIG
[ -f $ENV_LOCAL_CONFIG ] && source $ENV_LOCAL_CONFIG
[ -f $ENV_OVERRIDE_CONFIG ] && source $ENV_OVERRIDE_CONFIG
