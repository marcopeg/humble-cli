
getHostIp() {
    if [ "yes" = $(isOsx) ]; then
        echo $(ifconfig | grep broadcast | awk '{print $2}')
    else
        echo hostname -I | awk '{print $1}'
    fi
}
