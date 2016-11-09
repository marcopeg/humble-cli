
for APP in $(enabledApps); do
    APP_CWD="$SERVER_CWD/apps/$APP"
    echo ""
    echo "==============================================="
    echo "> $APP"
    echo "==============================================="
    (cd "$APP_CWD" && humble info)
done

exit 0
