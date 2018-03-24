from __future__ import absolute_import
from celery import shared_task
from .models import CeleryExecutionResult

import docker
import pickle
import os
import sys
from io import StringIO

DEBUG = os.environ.get('DEBUG', False)

@shared_task(max_retries=1)
def execute_code(section_id, code, tests):
    client = docker.from_env()
    error_output = b''
    output = b''
    celery_result = None
    try:
        args = [code]
        tests_arg = [test[1] for test in tests]
        args.extend(tests_arg)

        if DEBUG:
            sys.stdout = output
            old_argv = sys.argv
            sys.argv = ['']
            sys.argv.extend(args)
            from oc_api.pyexec.dockertemplate.runner import result
            sys.argv = old_argv
            celery_result = result
        else:
            output = client.containers.run("python_runner", command=args)

    except docker.errors.ContainerError as err:
        error_output = err.stderr

    # Unmangle our latin-1 string (which is hopefully utf-8), then encode it back into the bytes pickle expects.
    if not celery_result:
        celery_result = pickle.loads(output.decode('utf-8').encode('latin-1'))
    main_out, main_err, req_results = celery_result
    results = [(test[0], req_results[index]) for index, test in enumerate(tests)]

    return CeleryExecutionResult(mainExecOutput=main_out, mainExecError=main_err, results=results, section_id=section_id)
