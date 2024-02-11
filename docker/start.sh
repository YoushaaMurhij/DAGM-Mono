#!/bin/bash

cd "$(dirname "$0")"
cd ..

workspace_dir=$PWD
desktop_start() {
    docker run --ipc=host -it -d --rm \
        --gpus 'all,"capabilities=compute,utility,graphics"' \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --privileged \
        --name dagm_mono \
        --net "host" \
        -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
 	    -v $workspace_dir/:/home/user/dagm_mono:rw \
        ${ARCH}/dagm_mono:latest
    
    XAUTH=/tmp/.docker.xauth

    xauth_list=$(xauth nlist :0 | tail -n 1 | sed -e 's/^..../ffff/')
    if [ ! -f $XAUTH ]; then
        if [ ! -z "$xauth_list" ]; then
            echo $xauth_list | xauth -f $XAUTH nmerge -
        else
            touch $XAUTH
        fi
	chmod a+r $XAUTH
    fi

    file $XAUTH
    ls -FAlh $XAUTH
}


main () {
    if [ "$(docker ps -aq -f status=exited -f name=dagm_mono)" ]; then
        docker rm dagm_mono;
    fi

    ARCH="$(uname -m)"

    desktop_start;

    docker exec -it --user "user" dagm_mono \
        /bin/bash -c "
        cd /home/user/dagm_mono;
        ";
}

main;
    
