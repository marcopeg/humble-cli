#
# Calculates MD5 hash of a given string
#
#     HASHED_STR=$(hash $STR)
#

hash () {
    [[ $(which md5) ]] && HASH_CMD=md5 || HASH_CMD=md5sum
    VAL=$(echo $1 | $HASH_CMD)
    VAL=${VAL%???}
    echo $VAL
}
