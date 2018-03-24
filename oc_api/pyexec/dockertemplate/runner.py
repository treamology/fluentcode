import sys, pickle, traceback
from io import StringIO
import builtins

class PersistentLocals(object):
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

class InputRequired(Exception):
    pass

def print_formatted_exception():
    t, v, tb = sys.exc_info()
    print("Traceback (most recent call last):", file=sys.stderr)
    traceback.print_tb(tb, limit=-len(traceback.extract_tb(tb)) + 1)
    print(*traceback.format_exception_only(t, v), file=sys.stderr)

def run_user_code(user_code, gathered_inputs, tests):
    # We're going to replace the builtin input behavior with our own that suits the site.
    _input = builtins.input
    input_count = 0

    def input():
        nonlocal input_count

        try:
            the_input = gathered_inputs[input_count]
        except IndexError:
            raise InputRequired

        input_count += 1
        return the_input

    builtins.input = input

    #
    # Code Execution
    #

    exec_std_out = StringIO()
    exec_std_err = StringIO()

    # Redirect stdout and stderr
    sys.stdout = exec_std_out
    sys.stderr = exec_std_err

    # Transform the code into a function definition
    code = 'def student_func():\n' + user_code
    code = code.replace('\n', '\n    ')

    try:
        namespace = {}
        exec(code, namespace)
    except Exception:
        print_formatted_exception()

    try:
        student_func_locals_obj = PersistentLocals(namespace['student_func'])
        student_func_locals_res = student_func_locals_obj()
        student_func_locals = student_func_locals_obj.locals
    except InputRequired:
        main_exec_output = exec_std_out.getvalue()
        main_exec_error = exec_std_err.getvalue()
        exec_std_out.close()
        exec_std_err.close()
        sys.stdout = sys.__stdout__
        sys.stderr = sys.__stderr__

        return main_exec_output, main_exec_error, None, False
    finally:
        builtins.input = _input

    main_exec_output = exec_std_out.getvalue()
    main_exec_error = exec_std_err.getvalue()
    exec_std_out.close()
    exec_std_err.close()
    sys.stdout = sys.__stdout__
    sys.stderr = sys.__stderr__

    test_results = []

    if not main_exec_error:
        for task in tests:
            exec_std_out = StringIO()
            exec_std_err = StringIO()
            sys.stdout = exec_std_out
            sys.stderr = exec_std_err

            try:
                exec(task)
                success = test(main_exec_output, student_func, student_func_locals)
            except Exception:
                print_formatted_exception()
                break

            result = (success, exec_std_out.getvalue(), exec_std_err.getvalue())
            test_results.append(result)

            exec_std_out.close()
            exec_std_err.close()

    exec_std_out.close()
    exec_std_err.close()
    sys.stdout = sys.__stdout__
    sys.stderr = sys.__stderr__

    # pickle returns a set of bytes, so we decode the bytes into latin-1 (which can store 256 values).
    # When we send this off to stdout, it gets encoded into utf-8 (or whatever encoding the system uses).
    return main_exec_output, main_exec_error, test_results, True


if __name__ == '__main__':
    if len(sys.argv) == 1:
        exit(2)
    result = run_user_code(sys.argv[1], sys.argv[2], sys.argv[3:])
    print(pickle.dumps(result).decode('latin-1'))
