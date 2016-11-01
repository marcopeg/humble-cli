
SERVICE_NAME=$(urlGetService $3)
SERVICE_PATH=$(urlGetPath $3)
SOURCE_CID=$(getContainerId $SERVICE_NAME)
TARGET_FOLDER=${4:-$(basename $SERVICE_PATH)}
TARGET_PATH="$PROJECT_CWD/$TARGET_FOLDER"

echo ""
echo "====== UTILS - FS-EXPORT ======"
if [[ "" == "$3" ]]; then
    echo "ERROR: origin was not set"
    echo ""
    echo ""
    exit
fi
echo "service:  $SERVICE_NAME"
echo "path:     $SERVICE_PATH"
echo "target:   $TARGET_PATH"
echo "(sleep 3s, you can abort now)"
sleep 3
echo ""
echo ""

echo "--> start..."
CMD="mkdir -p $TARGET_PATH && docker run --rm --volumes-from=$SOURCE_CID -v=$TARGET_PATH:/host-working-folder marcopeg/humble cp -rf $SERVICE_PATH/. /host-working-folder"
eval $CMD

echo "--> fs-export complete!"
echo ""
echo ""
exit
