
# interpolate target service
SERVICE_NAME=$(urlGetService "$P3")
SERVICE_PATH=$(urlGetPath "$P3")
SERVICE_CID=$(getContainerId "$SERVICE_NAME")

# compute backup file name
BACKUP_TARGET="$PROJECT_CWD/$BACKUP_ROOT"
BACKUP_INTERNAL_PATH=$(echo $SERVICE_PATH | tr / .)
BACKUP_INTERNAL_PATH=${BACKUP_INTERNAL_PATH:1}

BACKUP_NAME="${P4:-$BACKUP_NAME}"
BACKUP_NAME=${BACKUP_NAME:-$BACKUP_FS_DUMP_FORMAT}
BACKUP_NAME="${BACKUP_NAME/\%s/$SERVICE_NAME}"
BACKUP_NAME="${BACKUP_NAME/\%p/$BACKUP_INTERNAL_PATH}"
BACKUP_NAME="${BACKUP_NAME/\%d/$BACKUP_DATE}.tar.gz"

# make a nice backup structure
SERVICE_PATH_DIRNAME=$(dirname $SERVICE_PATH)
SERVICE_PATH_BASENAME=$(basename $SERVICE_PATH)

if [ "$PRINT_FEEDBACK" == "yes" ]; then
    echo ""
    echo "====== UTILS - FS-DUMP ======"
    echo "service:  $SERVICE_NAME"
    echo "path:     $SERVICE_PATH"
    echo "target:   $BACKUP_ROOT/$BACKUP_NAME"
    echo "(sleep "$BACKUP_DELAY"s, you can abort now)"
    sleep $BACKUP_DELAY
    echo ""
    echo ""
fi
#
[ "$PRINT_FEEDBACK" == "yes" ] && echo "--> start..."
CMD="mkdir -p $BACKUP_TARGET && docker run --rm --volumes-from=$SERVICE_CID -v=$BACKUP_TARGET:/host-working-folder marcopeg/humble tar cvzf /host-working-folder/$BACKUP_NAME -C $SERVICE_PATH_DIRNAME ${SERVICE_PATH_BASENAME:-.}"
eval $CMD

if [ "$PRINT_FEEDBACK" == "yes" ]; then
    echo ""
    echo "--> fs-dump complete!"
    echo ""
    echo ""
fi
exit
