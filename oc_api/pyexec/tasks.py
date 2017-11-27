from __future__ import absolute_import
from celery import shared_task

import docker

@shared_task
def add(x, y):
    return x + y

@shared_task
def execute_code(code):
    client = docker.from_env()
    output = client.containers.run("python_runner", ["-c", code])
    return output.decode('utf-8')
