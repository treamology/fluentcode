import sys, pickle, traceback
from io import StringIO

class persistent_locals2(object):
    def __init__(self, func):
        self._locals = {}
        self.func = func

    def __call__(self, *args, **kwargs):
        def tracer(frame, event, arg):
            if event=='return':
                self._locals = frame.f_locals.copy()

        # tracer is activated on next call, return or exception
        sys.setprofile(tracer)
        try:
            # trace the function call
            res = self.func(*args, **kwargs)
        finally:
            # disable tracer and replace with old one
            sys.setprofile(None)
        return res

    def clear_locals(self):
        self._locals = {}

    @property
    def locals(self):
        return self._locals

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

# Transform the code into a function definition
code = 'def studentFunc():\n' + code
code = code.replace('\n', '\n    ')

studentFunc = None

try:
    exec(code)

    studentFuncLocalsObj = persistent_locals2(studentFunc)
    studentFuncLocalsRes = studentFuncLocalsObj()
    studentFuncLocals = studentFuncLocalsObj.locals

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
            success = test(mainExecOutput, studentFunc, studentFuncLocals)
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
result = (mainExecOutput, mainExecError, testResults)

if __name__ == '__main__':
    print(pickle.dumps(result).decode('latin-1'))