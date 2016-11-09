
# Ask confirm to proceed
enterToContinue

for APP in $(runningApps); do
    APP_CWD="$SERVER_CWD/apps/$APP"
    echo "[Humble Server] tearing down $APP"
    (cd "$APP_CWD" && humble down)
done

exit 0
