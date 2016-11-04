function getContainerId {
	eval $COMPOSE_CMD ps -q $1
}

function getContainerRunCmd {
    STATUS=$(docker inspect --format="{{ .State.Running }}" $1)
    if [[ "true" == $STATUS ]]; then
        echo "exec"
    else
        echo "run --rm"
    fi
}

function urlGetService {
    SERVICE="`echo $1 | grep '://' | sed -e's,^\(.*://\).*,\1,g'`"
    if [[ ! -z $SERVICE ]]; then
        echo ${SERVICE%???}
    fi
}

function urlGetPath {
    SERVICE="`echo $1 | grep '://' | sed -e's,^\(.*://\).*,\1,g'`"
    if [[ ! -z $SERVICE ]]; then
        echo "/"$1 | sed -e s,$SERVICE,,g
    fi
}




BACKUP_DELAY=${BACKUP_DELAY:-3}
BACKUP_ROOT=${BACKUP_ROOT:-$HUMBLE_BACKUP}
BACKUP_DATE_FORMAT=${BACKUP_DATE_FORMAT:-"+%Y%m%d.%H%M%S"}

BACKUP_DATE=$(date $BACKUP_DATE_FORMAT)

PRINT_FEEDBACK="yes"
P3=$3
P4=$4

BACKUP_FS_DUMP_FORMAT=${BACKUP_FS_DUMP_FORMAT:-"%s___%p___%d"}
