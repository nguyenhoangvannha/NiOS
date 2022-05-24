# Threading problems

# Race conditions

## When race conditions occur
- A race condition occurs when two threads access a shared variable at the same time.
- The most common symptom of a race condition is unpredictable values of variables that are shared between multiple threads.

## How
Details and examples for a race condition
Each thread is allocated a predefined period of time to execute on a processor. When the time that is allocated for the thread expires, the thread's context is saved until its next turn on the processor, and the processor begins the execution of the next thread.

## Example
```VB
//Thread 1
Total = Total + val1
```

```VB
//Thread 2
Total = Total - val2
```

Total is 100, val1 is 50, and val2 is 15. Thread 1 gets an opportunity to execute but only completes steps 1 through 3. This means that Thread 1 read the variable and completed the addition. Thread 1 is now just waiting to write out its new value of 150. After Thread 1 is stopped, Thread 2 gets to execute completely. This means that it has written the value that it calculated (85) out to the variable Total. Finally, Thread 1 regains control and finishes execution. It writes out its value (150). Therefore, when Thread 1 is finished, the value of Total is now 150 instead of 85.

## Solution
- To prevent the race conditions from occurring, you can lock shared variables, so that only one thread at a time has access to the shared variable.
- Execute threads that access the variable serially

# Deadlocks

## When deadlocks occur
- A deadlock occurs when two threads each lock a different variable at the same time and then try to lock the variable that the other thread already locked. As a result, each thread stops executing and waits for the other thread to release the variable. Because each thread is holding the variable that the other thread wants, nothing occurs, and the threads remain deadlocked.
- A common symptom of deadlock is that the program or group of threads stops responding. This is also known as a hang.
## Example
```VB
//Thread 1
SyncLock LeftVal
    SyncLock RightVal
        'Perform operations on LeftVal and RightVal that require read and write.
    End SyncLock
End SyncLock
```

```VB
//Thread 2
SyncLock RightVal
    SyncLock LeftVal
        'Perform operations on RightVal and LeftVal that require read and write.
    End SyncLock
End SyncLock
```

A deadlock occurs when Thread 1 is permitted to lock LeftVal. The processor stops Thread 1's execution and begins the execution of Thread 2. Thread 2 locks RightVal and then tries to lock LeftVal. Because LeftVal is locked, Thread 2 stops and waits for LeftVal to be released. Because Thread 2 is stopped, Thread 1 is permitted to continue executing. Thread 1 tries to lock RightVal but cannot, because Thread 2 has locked it. As a result, Thread 1 starts to wait until RightVal becomes available. Each thread waits for the other thread, because each thread has locked the variable that the other thread is waiting on, and neither thread is unlocking the variable that it is holding.

https://docs.microsoft.com/en-us/troubleshoot/developer/visualstudio/visual-basic/language-compilers/race-conditions-deadlocks
