#
# The objective of this command is to boot all the applications in
# the server as there was a complete clean state
#

humble server config build

for APP in $(enabledApps); do
    APP_CWD="$SERVER_CWD/apps/$APP"
    echo "[Humble Server] booting $APP"
    (cd "$APP_CWD" && humble up -d)
done

exit 0
