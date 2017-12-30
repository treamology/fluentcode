import sys, pickle
from io import StringIO

if len(sys.argv) == 1:
    exit(2)

code = sys.argv[1]

execStdOut = StringIO()
execStdErr = StringIO()

# Redirect stdout and stderr
sys.stdout = execStdOut
sys.stderr = execStdErr

exec(code)

mainExecOutput = execStdOut.getvalue()
mainExecError = execStdErr.getvalue()

taskStdOut = []
taskStdErr = []

for i in range(2, len(sys.argv) - 1):
    execStdOut.flush()
    execStdErr.flush()

    task = sys.argv[i]
    exec(task)

    taskStdOut.append(execStdOut.getvalue())
    taskStdErr.append(execStdErr.getvalue())

execStdOut.close()
execStdErr.close()

sys.stdout = sys.__stdout__
sys.stderr = sys.__stderr__

# Dump the result tuple to stdout
result = pickle.dump((mainExecOutput, mainExecError, taskStdOut, taskStdErr), sys.stdout.buffer)
