BACKUP_SOURCE="$P3"
if [ $(isAbsolutePath $BACKUP_SOURCE) = "false" ]; then
    BACKUP_SOURCE="$PROJECT_CWD/$BACKUP_ROOT/$BACKUP_SOURCE"
fi

if [[ ! -f "$BACKUP_SOURCE" ]]; then
    echo ""
    echo "====== UTILS - FS-SEED ======"
    echo "ERROR: Backup file does not exists!"
    echo "($BACKUP_SOURCE)"
    echo ""
    echo ""
    exit
fi

BACKUP_PATH=$(dirname "$BACKUP_SOURCE")
BACKUP_FILE=$(basename "$BACKUP_SOURCE")

# Interpolate the target volume from the backup file name
SERVICE_STRING="$P4"
if [[ "" == "$SERVICE_STRING" ]]; then
    SERVICE_STRING=$BACKUP_FILE
    SERVICE_STRING="`echo $SERVICE_STRING | grep '___' | sed -e's,^\(.*___\).*,\1,g'`"
    SERVICE_STRING="${SERVICE_STRING%???}"
    SERVICE_STRING=$(stringToServiceUrl "$SERVICE_STRING")
fi

# interpolate target service
SERVICE_NAME=$(urlGetService $SERVICE_STRING)
SERVICE_PATH=$(urlGetPath $SERVICE_STRING)
SERVICE_CID=$(getContainerId $SERVICE_NAME)

if [ "$PRINT_FEEDBACK" == "yes" ]; then
    echo ""
    echo "====== UTILS - FS-SEED ======"
    echo "source:   $BACKUP_PATH"
    echo "file:     $BACKUP_FILE"
    echo "service:  $SERVICE_NAME"
    echo "path:     $SERVICE_PATH"
    enterToContinue
    echo ""
    echo ""
fi

echo "[$BACKUP_FILE] fs-seed start..."
CMD="docker run --rm --volumes-from=$SERVICE_CID -v=$BACKUP_SOURCE:/host-backup-source marcopeg/humble sh -c \"mkdir -p $(dirname $SERVICE_PATH) && cd $(dirname $SERVICE_PATH) && tar xvfz /host-backup-source\""
eval $CMD

echo ""
echo "[$BACKUP_FILE] fs-seed complete!"
echo ""
echo ""
exit
