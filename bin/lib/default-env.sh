#
# Set the default Humble Environment
# (development)
#

if [ -z "$HUMBLE_ENV" ]; then

    echo ""
    echo "=== WARNING ==="
    echo "\$HUMBLE_ENV not set!"
    echo "Humble will set up your enviroment to \"development\","
    echo "copy this to your \".env\" file to fix this warning:"
    echo ""
    echo "    \$HUMBLE_ENV=\"development\""
    echo ""
    echo ""
    sleep 2

    HUMBLE_ENV="default"
fi
