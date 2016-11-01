#
# on OSx need to install:
#
#     brew install coreutils
#

microseconds () {
    SECONDS=$(date +%s)
    MICROS=$(date +%N)

    if [ "N" == "$MICROS" ]; then
        if [ $(which gdate) ]; then
            MICROS=$(gdate +%N)
        else
            MICROS="000000000"
        fi
    fi

    # divide by 100000

    echo "$SECONDS.$MICROS"
}
