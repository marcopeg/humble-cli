#
# Set the default Humble Environment
# (development)
#

if [ -z "$HUMBLE_ENV" ]; then
#
#     echo ""
#     echo "=== WARNING ==="
#     echo "\$HUMBLE_ENV not set!"
#     echo "Humble will set up your enviroment to \"development\","
#     echo "copy this to your \".env\" file to fix this warning:"
#     echo ""
#     echo "    \$HUMBLE_ENV=\"development\""
#     echo ""
#     echo ""
#     enterToContinue
#
    HUMBLE_ENV="default"
fi

if [ -z "$HUMBLE_DATA" ]; then
    HUMBLE_DATA="$PROJECT_CWD/data"
    DECLARED_ENV_VARS="$DECLARED_ENV_VARS HUMBLE_DATA=$HUMBLE_DATA"
fi

if [ -z "$HUMBLE_BACKUP" ]; then
    HUMBLE_BACKUP="$PROJECT_CWD/data/backup"
    DECLARED_ENV_VARS="$DECLARED_ENV_VARS HUMBLE_BACKUP=$HUMBLE_BACKUP"
fi
