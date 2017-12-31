from collections import namedtuple

CeleryExecutionResult = namedtuple('CeleryExecutionResult',
                                   ['mainExecOutput', 'mainExecError', 'results'])

ExecutionResult = namedtuple('ExecutionResult', ['status', 'result', 'error', 'reason', 'requirements'])
ExecutionResult.__new__.__defaults__ = (None,) * len(ExecutionResult._fields)  # Make all fields optional

TestResult = namedtuple('TestResult', ['success', 'out', 'err'])