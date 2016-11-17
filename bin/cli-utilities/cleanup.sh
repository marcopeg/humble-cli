
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

if [ "$3" == "networks" ]; then
    docker network rm $(docker network ls -q)
fi

if [ "$3" == "all" ]; then
    enterToContinue
    echo "Cleanup containers..."
    humble do cleanup containers >/dev/null 2>/dev/null
    echo "Cleanup volumes..."
    humble do cleanup volumes >/dev/null 2>/dev/null
    echo "Cleanup images..."
    humble do cleanup images >/dev/null 2>/dev/null
    echo "Cleanup networks..."
    humble do cleanup networks >/dev/null 2>/dev/null
fi

exit 0
