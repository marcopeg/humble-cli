
# interpolate target service
SERVICE_STRING="$P3"
SERVICE_NAME=$(urlGetService "$SERVICE_STRING")
SERVICE_PATH=$(urlGetPath "$SERVICE_STRING")
SERVICE_CID=$(getContainerId "$SERVICE_NAME")

# compute backup file name
BACKUP_NAME="$(serviceUrlToString "$SERVICE_STRING")___$BACKUP_DATE.tar.gz"
BACKUP_TARGET=${P4:-"$BACKUP_ROOT"}
if [ "$(isAbsolutePath $BACKUP_TARGET)" == "false" ]; then
    BACKUP_TARGET="$BACKUP_ROOT/$BACKUP_TARGET"
fi

if [ $(isTarGzPath $BACKUP_TARGET) = "true" ]; then
    BACKUP_NAME=$(basename "$BACKUP_TARGET")
    BACKUP_TARGET=$(dirname "$BACKUP_TARGET")
fi

# make a nice backup structure
SERVICE_PATH_DIRNAME=$(dirname $SERVICE_PATH)
SERVICE_PATH_BASENAME=$(basename $SERVICE_PATH)

if [ "$PRINT_FEEDBACK" == "yes" ]; then
    echo ""
    echo "====== UTILS - FS-DUMP ======"
    echo "service:  $SERVICE_NAME"
    echo "path:     $SERVICE_PATH"
    echo "target:   $BACKUP_TARGET"
    echo "name:     $BACKUP_NAME"
    enterToContinue
    echo ""
    echo ""
fi

echo "[$SERVICE_STRING] fs-backup start..."
CMD="mkdir -p $BACKUP_TARGET && docker run --rm --volumes-from=$SERVICE_CID -v=$BACKUP_TARGET:/host-working-folder marcopeg/humble tar cvzf /host-working-folder/$BACKUP_NAME -C $SERVICE_PATH_DIRNAME ${SERVICE_PATH_BASENAME:-.}"
eval $CMD

echo ""
echo "[$SERVICE_STRING] fs-backup complete!"
echo ""
echo ""
exit
