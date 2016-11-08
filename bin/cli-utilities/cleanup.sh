
if [ "$3" == "volumes" ]; then
    docker volume rm $(docker volume ls -qf dangling=true)
fi

if [ "$3" == "containers" ]; then
    docker stop $(docker ps -a -q)
    docker rm -f $(docker ps -a -q)
fi

if [ "$3" == "images" ]; then
    docker rmi -f $(docker images -q)
fi

exit 0
