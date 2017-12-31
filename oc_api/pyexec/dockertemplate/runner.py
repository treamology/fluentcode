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
results = []

testResults = []

if not mainExecError:
    for i in range(2, len(sys.argv)):
        execStdOut = StringIO()
        execStdErr = StringIO()
        sys.stdout = execStdOut
        sys.stderr = execStdErr

        task = sys.argv[i]
        exec(task)
        success = test()

        result = (success, execStdOut.getvalue(), execStdErr.getvalue())
        testResults.append(result)
        #testResults.append(TestResult(success=success, out=execStdOut.getvalue(), err=execStdErr.getvalue()))

        execStdOut.close()
        execStdErr.close()

sys.stdout = sys.__stdout__
sys.stderr = sys.__stderr__

# pickle returns a set of bytes, so we decode the bytes into latin-1 (which can store 256 bits).
# When we send this off to stdout, it gets encoded into utf-8 (or whatever encoding the system uses).
result = pickle.dumps((mainExecOutput, mainExecError, testResults)).decode('latin-1')
print(result)