from oc_api.pyexec import tasks
from oc_api.pyexec.models import CeleryExecutionResult, TestResult
from celery.result import AsyncResult
import sys, time
from . import celery_app

TASK_ID = 'deadbeef'

input_file = open(sys.argv[1], 'r')

celery_app.launch_app()

tasks.execute_code.apply_async(
    args=(0, input_file.read(), []),
    task_id=TASK_ID
)

complete = False
result = None
while not complete:
    time.sleep(0.1)
    unknown_result = AsyncResult(TASK_ID)
    if not unknown_result or not unknown_result.ready():
        continue

    complete = True
    result = CeleryExecutionResult(*unknown_result.result)
    unknown_result.forget()


print('stdout: ' + result.mainExecOutput)
print('stderr: ' + result.mainExecError)
for test, index in result.results:
    print('test ' + index + ' stdout: ' + test.out)
    print('test ' + index + ' stderr: ' + test.err)

input_file.close()
