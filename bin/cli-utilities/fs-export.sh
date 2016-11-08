
SERVICE_STRING="$3"
SERVICE_NAME=$(urlGetService "$SERVICE_STRING")
SERVICE_PATH=$(urlGetPath "$SERVICE_STRING")
SOURCE_CID=$(getContainerId $SERVICE_NAME)
TARGET_FOLDER=${4:-$(serviceUrlToString $3)}

# accept an absolute path as host target for the export commands
if [ "$(isAbsolutePath $TARGET_FOLDER)" == "true" ]; then
    TARGET_PATH="$TARGET_FOLDER"
else
    TARGET_PATH="$PROJECT_CWD/$TARGET_FOLDER"
fi

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
enterToContinue
echo ""
echo ""

echo "--> start..."
mkdir -p "$TARGET_PATH"
CMD="docker run --rm --volumes-from=$SOURCE_CID -v=$TARGET_PATH:/host-working-folder marcopeg/humble cp -rf $SERVICE_PATH/. /host-working-folder"
eval "$CMD"

echo "--> fs-export complete!"
echo ""
echo ""
exit
