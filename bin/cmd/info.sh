
echo ""
echo ""
echo "    HumbleCLI"
echo "    ========="
echo ""
echo "    # Environment:"
echo "    -----------------------"
for VAR in $DECLARED_ENV_VARS; do
    echo "    $VAR"
done

if [ ! -z "$HUMBLE_FORCED_ENV" ]; then
    echo ""
    echo ""
    echo "    # Forced (via CLI):"
    echo "    -----------------------"
    echo "    HUMBLE_ENV=$HUMBLE_FORCED_ENV"
fi

echo ""
echo ""
echo "    # Docker Compose Config"
echo "    -----------------------"
echo "    $WHICH_COMPOSE"
echo ""
echo ""
exit 0
