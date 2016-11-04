
serviceUrlToString() {
    SERVICE_URL="$1"
    SERVICE_NAME=$(urlGetService "$SERVICE_URL")
    SERVICE_PATH=$(urlGetPath "$SERVICE_URL")
    SERVICE_PATH=${SERVICE_PATH//\//---}
    SERVICE_PATH=${SERVICE_PATH:3}
    echo "$SERVICE_NAME""___$SERVICE_PATH"
}

stringToServiceUrl() {
    SERVICE_STRING="$1"

    SERVICE_NAME="`echo $SERVICE_STRING | grep '___' | sed -e's,^\(.*___\).*,\1,g'`"
    if [[ ! -z "$SERVICE_NAME" ]]; then
        SERVICE_NAME=${SERVICE_NAME%???}
    fi

    SERVICE_PATH="`echo $SERVICE_STRING | grep '___' | sed -e's,^\(.*___\).*,\1,g'`"
    if [[ ! -z "$SERVICE_PATH" ]]; then
        SERVICE_PATH=$(echo "$SERVICE_STRING" | sed -e s,$SERVICE_PATH,,g)
        SERVICE_PATH=${SERVICE_PATH//---/\/}
    fi

    echo "$SERVICE_NAME://$SERVICE_PATH"
}
