
for APP in $(runningApps); do
    APP_CWD="$SERVER_CWD/apps/$APP"
    echo "[Humble Server] stopping $APP"
    (cd "$APP_CWD" && humble stop)
done

exit 0
