## Building image
    docker build -t calou/hypriot-zookeeper . 

##�Starting container
    docker run -d -e MYID=1 --name=zookeeper --net=host --restart=always calou/hypriot-zookeeper
