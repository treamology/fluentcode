from __future__ import absolute_import
from celery import shared_task

import docker


class ExecutionResult:
    result = ''
    error_output = ''

    def __init__(self, result, error_output):
        self.result = result
        self.error_output = error_output

@shared_task
def add(x, y):
    return x + y

@shared_task(max_retries=1)
def execute_code(code, tests):
    client = docker.from_env()
    output = b''
    error_output = b''
    try:
        output = client.containers.run("python_runner", ["-c", code])
    except docker.errors.ContainerError as err:
        error_output = err.stderr

    result = ExecutionResult(output.decode('utf-8'), error_output.decode('utf-8'))

    return vars(result)
