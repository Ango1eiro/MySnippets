- ***withContext*** is best used when you need to return a **single value** from a suspendable piece of code, whereas ***async/await*** are best used when you have **multiple functions** running in parallel combined to produce one result.  
- There are three main coroutine context elements: the ***Job***, which defines the lifecycle and can be cancelled, a ***CoroutineExceptionHandler***, which takes care 
of errors, and the ***ContinuationInterceptor***, which handles function execution flow and threading  
- A good recommendation is to use ***flowWithLifecycle*** when you need to collect only one flow and use ***repeatOnLifecycle*** when you have multiple flows  
- When launching coroutines in activities, use ***lifecycleScope***. When launching coroutines in fragments, use ***viewLifecycleOwner.lifecycleScope***  
- When observing flows from the UI, make sure to use ***repeatOnLifecycle*** or ***flowWithLifecycle***  
- Use ***LaunchedEffect*** or ***rememberCoroutineScope*** to launch coroutines in composables
