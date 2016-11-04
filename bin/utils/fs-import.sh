SERVICE_NAME=$(urlGetService $4)
SERVICE_PATH=$(urlGetPath $4)
SERVICE_CID=$(getContainerId $SERVICE_NAME)
SOURCE_PATH="$PROJECT_CWD/$3"

echo ""
echo "====== UTILS - FS-IMPORT ======"
if [ ! -d $SOURCE_PATH ]; then
    echo "ERROR: source folder does not exists"
    echo "($SOURCE_PATH)"
    echo ""
    echo ""
    exit
fi
echo "from:     $SOURCE_PATH"
echo "service:  $SERVICE_NAME"
echo "path:     $SERVICE_PATH"
echo "(sleep 3s, you can abort now)"
enterToContinue
echo ""
echo ""

echo "--> start..."
CMD="docker run --rm --volumes-from=$SERVICE_CID -v=$SOURCE_PATH:/host-working-folder marcopeg/humble cp -rf /host-working-folder/. $SERVICE_PATH"
eval $CMD

echo "--> fs-import complete!"
echo ""
echo ""
exit
