from __future__ import absolute_import
from celery import shared_task, task
from celery.contrib import rdb
from collections import namedtuple
from .models import CeleryExecutionResult, TestResult

import docker
import pickle, sys

@shared_task
def add(x, y):
    return x + y

@shared_task(max_retries=1)
def execute_code(section_id, code, tests):
    client = docker.from_env()
    error_output = b''
    output = b''
    try:
        args = [code]
        tests_arg = [test[1] for test in tests]
        args.extend(tests_arg)

        output = client.containers.run("python_runner", command=args)

    except docker.errors.ContainerError as err:
        error_output = err.stderr

    # Unmangle our latin-1 string (which is hopefully utf-8), then encode it back into the bytes pickle expects.
    #rdb.set_trace()
    celery_result = pickle.loads(output.decode('utf-8').encode('latin-1'))
    main_out, main_err, req_results = celery_result
    #raise Exception(req_results, len(tests))
    results = [(test[0], req_results[index]) for index, test in enumerate(tests)]

    #rdb.set_trace()
    return CeleryExecutionResult(mainExecOutput=main_out, mainExecError=main_err, results=results, section_id=section_id)
