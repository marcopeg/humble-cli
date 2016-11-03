
indexOf() {
    x="${1%%$2*}"
    RES=$([[ $x = $1 ]] && echo -1 || echo ${#x})

    if [ "$RES" == "${#1}" ]; then
        echo -1
    else
        echo $RES
    fi
}
