Python Execution API
---
##### /api/code/execute <sup>GET POST</sup>
Endpoint for actually executing python code.

**GET:** Gets the status of current code execution.

<u>Args:</u> authtoken

<u>On Success</u>:
Ex: ` {'status': 0, 'result': 'Hello world!'}`
* `status`: 0 = success, 1 = exception, 2 = processing, 3 = timeout
* `result`: Properly escaped output of the code. Could contain traebacks, it's up to the client to interpret them properly.
* `completed_goals`: Section goal IDs that were properly fulfilled

<u>On Exception</u>:
Ex: ` {'status': 1, 'traceback': '...'}`

<u>On Timeout</u>:
Ex: ` {'status': 3, reason: 'Code took too long to execute'}`

**POST:** Asks the server to execute some code

<u>Args:</u>
* `code`: the code to execute
* `lesson_context`: list of lesson number and section
    * `[2, 3]`

<u>Returns</u>
* `status`: 0 = success, 1 = fail


---------------------

