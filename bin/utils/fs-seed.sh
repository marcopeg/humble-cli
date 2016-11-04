BACKUP_FILE=${P3}
BACKUP_PATH="$PROJECT_CWD/$BACKUP_ROOT/$BACKUP_FILE"


if [[ ! -f "$BACKUP_PATH" ]]; then
    echo ""
    echo "====== UTILS - FS-SEED ======"
    echo "ERROR: Backup file does not exists!"
    echo "($BACKUP_PATH)"
    echo ""
    echo ""
    exit
fi

# interpolate service string from backup file name
SERVICE_STRING=$P4
if [[ "" == "$SERVICE_STRING" ]]; then
    SERVICE_STRING=$BACKUP_FILE
    SERVICE_STRING="`echo $SERVICE_STRING | grep '___' | sed -e's,^\(.*___\).*,\1,g'`"
    SERVICE_STRING="${SERVICE_STRING%???}"
    SERVICE_STRING=$(echo $SERVICE_STRING | tr . /)
    SERVICE_STRING="${SERVICE_STRING/___/://}"
fi

# interpolate target service
SERVICE_NAME=$(urlGetService $SERVICE_STRING)
SERVICE_PATH=$(urlGetPath $SERVICE_STRING)
SERVICE_CID=$(getContainerId $SERVICE_NAME)

if [ "$PRINT_FEEDBACK" == "yes" ]; then
    echo ""
    echo "====== UTILS - FS-SEED ======"
    echo "source:   $BACKUP_ROOT/$BACKUP_FILE"
    echo "service:  $SERVICE_NAME"
    echo "path:     $SERVICE_PATH"
    enterToContinue
    echo ""
    echo ""
fi

[ "$PRINT_FEEDBACK" == "yes" ] && echo "--> start..."
CMD="docker run --rm --volumes-from=$SERVICE_CID -v=$BACKUP_PATH:/host-backup-source marcopeg/humble sh -c \"mkdir -p $(dirname $SERVICE_PATH) && cd $(dirname $SERVICE_PATH) && tar xvfz /host-backup-source\""
eval $CMD

if [ "$PRINT_FEEDBACK" == "yes" ]; then
    echo ""
    echo "--> fs-seed complete!"
    echo ""
    echo ""
fi
exit
