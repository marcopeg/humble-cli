
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
echo ""
echo ""
echo "    # Docker Compose Config"
echo "    -----------------------"
echo "    $WHICH_COMPOSE"
echo ""
echo ""
exit 0
