from .. import tasks
import sys

input_file = open(sys.argv[1], 'r')

tasks.execute_code.apply_async(
    args=(0, input_file.read(), []),
    task_id='deadbeef'
)

input_file.close()