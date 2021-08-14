#!/bin/bash

xhost +

if [ "$(docker ps -a | grep lsdslam_noros)" ]
then
    echo "Container already exists."
    echo "Run 'docker start lsdslam_noros; docker attach lsdslam_noros' to start"
    exit
fi

docker run -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "/media/j32u4ukh/TOSHIBA EXT/DockerVolume":/root/workspace/lsd_slam_noros/data \
    --name lsdslam_noros \
    -e "TERM=xterm-256color" \
    lsdslam_noros
