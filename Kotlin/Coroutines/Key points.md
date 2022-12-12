- ***withContext*** is best used when you need to return a **single value** from a suspendable piece of code, whereas ***async/await*** are best used when you have **multiple functions** running in parallel combined to produce one result.  
- There are three main coroutine context elements: the ***Job***, which defines the lifecycle and can be cancelled, a ***CoroutineExceptionHandler***, which takes care 
of errors, and the ***ContinuationInterceptor***, which handles function execution flow and threading
