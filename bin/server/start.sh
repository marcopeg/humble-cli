
for APP in $(enabledApps); do
    APP_CWD="$SERVER_CWD/apps/$APP"
    echo "[Humble Server] starting $APP"
    (cd "$APP_CWD" && humble start)
done

exit 0
