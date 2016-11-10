
SOURCE_PATH="$3"

if [ "$(isAbsolutePath $SOURCE_PATH)" == "false" ]; then
    SERVICE_STRING=$(stringToServiceUrl "$SOURCE_PATH")
    SOURCE_PATH="$PROJECT_CWD/$SOURCE_PATH"
else
    SERVICE_STRING=$(stringToServiceUrl $(basename "$SOURCE_PATH"))
fi

SERVICE_STRING=${4:-"$SERVICE_STRING"}
SERVICE_NAME=$(urlGetService "$SERVICE_STRING")
SERVICE_PATH=$(urlGetPath "$SERVICE_STRING")
SERVICE_CID=$(getContainerId $SERVICE_NAME)

echo ""
echo "====== UTILS - FS-IMPORT ======"
if [ ! -f $SOURCE_PATH ]; then
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
CMD="docker run --rm --volumes-from=$SERVICE_CID -v=$SOURCE_PATH:/host-working-folder $HUMBLE_UTILS cp -rf /host-working-folder/. $SERVICE_PATH"
eval $CMD

echo "--> fs-import complete!"
echo ""
echo ""
exit
