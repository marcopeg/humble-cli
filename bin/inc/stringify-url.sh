
stringifyUrl () {
    STR=$1
    STR=${STR//\//_}
    STR=${STR//./_}
    STR=${STR//-/_}
    echo $STR
}
