from oc_api.pyexec import tasks
from oc_api.pyexec.models import CeleryExecutionResult, TestResult
from celery.result import AsyncResult
import sys, time, inspect
from . import celery_app, input, unit_tests

TASK_ID = 'deadbeef'

test_members = inspect.getmembers(unit_tests)
test_list = []

for name, value in test_members:
    if 'test_' in name:
        source = inspect.getsource(value)
        source = source.replace(name, 'test')
        test_list.append((0, source))

tasks.execute_code.apply_async(
    args=(0, inspect.getsource(input), test_list),
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


print('stdout: ' + result.mainExecOutput, end='')
print('stderr: ' + result.mainExecError)
for index, test in result.results:
    print('test ' + str(index) + ' result: ' + str(test[0]))
    print('test ' + str(index) + ' stdout: ' + test[1], end='')
    print('test ' + str(index) + ' stderr: ' + test[2], end='')
