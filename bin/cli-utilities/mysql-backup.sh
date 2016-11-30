
# interpolate target service
SERVICE_STRING="$P3"
SERVICE_NAME=$(urlGetService "$SERVICE_STRING")
SERVICE_PATH=$(urlGetPath "$SERVICE_STRING")

# get mysql details
MYSQL_HOST="$SERVICE_NAME"
MYSQL_DB=${SERVICE_PATH:1}

BACKUP_TARGET="$P4"

if [ "$PRINT_FEEDBACK" == "yes" ]; then
    echo ""
    echo "======== MYSQL BACKUP ========"
    echo "host:      $MYSQL_HOST"
    echo "database:  $MYSQL_DB"
    echo "target:    $BACKUP_TARGET"
    echo ""
    # enterToContinue
    echo ""
    echo ""
fi

INTERNAL_CMD="MYSQL_PWD=$""MYSQL_ROOT_PASSWORD exec mysqldump -uroot $MYSQL_DB"
COMPOSE_CMD="docker-compose exec $MYSQL_HOST sh -c '$INTERNAL_CMD'"
CMD="$DECLARED_ENV_VARS $COMPOSE_CMD > $BACKUP_TARGET"

eval $CMD

exit 0;

#CMD="$DECLARED_ENV_VARS docker-compose exec mysql sh -c 'MYSQL_PWD=$""MYSQL_ROOT_PASSWORD exec mysqldump -uroot $""MYSQL_DATABASE'"
#eval $CMD > "$PROJECT_CWD/dump.sql"
