
CONFIG_CMD="$3"

if [ "build" = "$CONFIG_CMD" ]; then
    echo "[Humble Server] building apps config..."
    runServerScript build-config.js
fi

if [ "show" = "$CONFIG_CMD" ]; then
    echo "[Humble Server] building apps config..."
    echo ""
    cat "$SERVER_CWD/humble-server.yml"
    echo ""
fi

exit 0
