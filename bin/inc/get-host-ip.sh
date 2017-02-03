
getHostIp() {
    if [ "yes" = $(isOsx) ]; then
        IPS=($(ifconfig | grep broadcast | awk '{print $2}'))
        echo "$IPS"
    else
        echo hostname -I | awk '{print $1}'
    fi
}
