#!/bin/bash

docker exec -it --user "user" dagm_mono \
    /bin/bash -c "
    cd /home/user/dagm_mono;
    export PYTHONPATH=\"${PYTHONPATH}:/home/user/dagm_mono\";
    /bin/bash"
