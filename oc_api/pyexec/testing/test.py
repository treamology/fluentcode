from oc_api.pyexec import tasks
from oc_api.pyexec.models import CeleryExecutionResult
from celery.result import AsyncResult
import sys, time, inspect, builtins
from . import unit_tests, celery_app

TASK_ID = 'deadbeef'

input_file = open(sys.argv[1])
code = input_file.read()

test_members = inspect.getmembers(unit_tests)
test_list = []
input_list = []

for name, value in test_members:
    if 'test_' in name:
        source = inspect.getsource(value)
        source = source.replace(name, 'test')
        test_list.append((0, source))

def run_code(inputs):
    tasks.execute_code.apply_async(
        args=(0, code, inputs, test_list),
        task_id=TASK_ID
    )

    task_complete = False
    result = None
    while not task_complete:
        time.sleep(0.1)
        unknown_result = AsyncResult(TASK_ID)
        if not unknown_result or not unknown_result.ready():
            continue

        task_complete = True
        result = CeleryExecutionResult(*unknown_result.result)
        unknown_result.forget()
    return result

result = run_code(input_list)
while not result.finished:
    input_list.append(builtins.input('(input) '))
    result = run_code(input_list)

print('stdout: ' + result.mainExecOutput, end='')
print('stderr: ' + result.mainExecError)
for index, test in result.results:
    print('test ' + str(index) + ' result: ' + str(test[0]))
    print('test ' + str(index) + ' stdout: ' + test[1], end='')
    print('test ' + str(index) + ' stderr: ' + test[2], end='')

input_file.close()