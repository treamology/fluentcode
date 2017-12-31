import sys, pickle, traceback
from io import StringIO

def print_formatted_exception():
    t, v, tb = sys.exc_info()
    print("Traceback (most recent call last):", file=sys.stderr)
    traceback.print_tb(tb, limit=-len(traceback.extract_tb(tb)) + 1)
    print(*traceback.format_exception_only(t, v), file=sys.stderr)

if len(sys.argv) == 1:
    exit(2)

code = sys.argv[1]

execStdOut = StringIO()
execStdErr = StringIO()

# Redirect stdout and stderr
sys.stdout = execStdOut
sys.stderr = execStdErr

try:
    exec(code)
except Exception:
    print_formatted_exception()

mainExecOutput = execStdOut.getvalue()
mainExecError = execStdErr.getvalue()

taskStdOut = []
taskStdErr = []
results = []

testResults = []

if not mainExecError:
    for i in range(2, len(sys.argv)):
        execStdOut = StringIO()
        execStdErr = StringIO()
        sys.stdout = execStdOut
        sys.stderr = execStdErr

        task = sys.argv[i]
        try:
            exec(task)
            success = test()
        except Exception:
            print_formatted_exception()
            break

        result = (success, execStdOut.getvalue(), execStdErr.getvalue())
        testResults.append(result)

        execStdOut.close()
        execStdErr.close()

sys.stdout = sys.__stdout__
sys.stderr = sys.__stderr__

# pickle returns a set of bytes, so we decode the bytes into latin-1 (which can store 256 bits).
# When we send this off to stdout, it gets encoded into utf-8 (or whatever encoding the system uses).
result = pickle.dumps((mainExecOutput, mainExecError, testResults)).decode('latin-1')
print(result)