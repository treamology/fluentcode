Python Execution API
---
##### /api/execute_code <sup>GET POST DELETE</sup>
Endpoint for actually executing python code.

---
**GET:** Gets the status of current code execution.

<u>Responses:</u>  
*On Success*:  
Ex: ` {'success': true, 'result': 'Hello world!'}`  
`result`: Properly escaped output of the code. Could contain traebacks, it's up to the client to interpret them properly.

*On Failure*:  
Ex: ` {'success': false, 'reason': 'An error has occurred.'}`

---

