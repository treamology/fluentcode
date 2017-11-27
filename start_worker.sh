#!/usr/bin/env bash

platform=$(uname)

if [[ ($platform == 'Darwin') ]]; then
    if pgrep -x "Docker" > /dev/null
    then
        echo "Docker Running"
    else
        echo "Docker Stopped"
        dockerd_path='/Applications/Docker.app'
        open "$dockerd_path"
    fi
fi

source ./venv/bin/activate
celery -A oc_backend worker --loglevel=info

