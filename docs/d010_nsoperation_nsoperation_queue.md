# NSOperation

## What

- An abstract class that represents the code and data associated with a single task.

## How
- Use NSOperation subclass or use one of the system-defined subclasses (NSInvocationOperation or NSBlockOperation) to perform the actual task.
- You typically execute operations by adding them to an operation queue (an instance of the NSOperationQueue class).

### Operation Dependencies
- Dependencies are a convenient way to execute operations in a specific order.
- Once the last dependent operation finishes, however, the operation object becomes ready and able to execute.
- Canceling an operation similarly marks it as finished not stop it when it already run.
- We can prevent execution of a task by provide dependency

### KVO-Compliant Properties
isCancelled - read-only

isAsynchronous - read-only

isExecuting - read-only

isFinished - read-only

isReady - read-only

dependencies - read-only

queuePriority - readable and writable

completionBlock - readable and writable
### Multicore Considerations
- The NSOperation class is itself multicore aware.

- When you subclass NSOperation, you must make sure that any overridden methods remain safe to call from multiple threads.
 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/Introduction/Introduction.html#//apple_ref/doc/uid/10000057i

### Asynchronous Versus Synchronous Operations
- If you plan on executing an operation object manually, instead of adding it to a queue, you can design your operation to execute in a synchronous or asynchronous manner. 
- Operation objects are synchronous by default. 
- In a synchronous operation, the operation object does not create a separate thread on which to run its task. When you call the start method of a synchronous operation directly from your code, the operation executes immediately in the current thread.

- When you call the start method of an asynchronous operation, that method may return before the corresponding task is completed.
- An asynchronous operation object is responsible for scheduling its task on a separate thread.The operation could do that by starting a new thread directly, by calling an asynchronous method, or by submitting a block to a dispatch queue for execution. It does not actually matter if the operation is ongoing when control returns to the caller, only that it could be ongoing.

- If you always plan to use queues to execute your operations, it is simpler to define them as synchronous. - If you execute operations manually, though, you might want to define your operation objects as asynchronous. Defining an asynchronous operation requires more work, because you have to monitor the ongoing state of your task and report changes in that state using KVO notifications. But defining asynchronous operations is useful in cases where you want to ensure that a manually executed operation does not block the calling thread.

- When you add an operation to an operation queue, the queue ignores the value of the asynchronous property and always calls the start method from a separate thread. Therefore, if you always run operations by adding them to an operation queue, there is no reason to make them asynchronous.

# NSOperationQueue

## What
- A queue that regulates the execution of operations.

## How 
- An operation queue invokes its queued NSOperation objects based on their priority and readiness. After you add an operation to a queue, it remains in the queue until the operation finishes its task. You can’t directly remove an operation from a queue after you add it.

- An operation queue executes its operations either directly, by running them on secondary threads, or indirectly using the libdispatch library (also known as Grand Central Dispatch).

## Determine the Execution Order
- An operation queue organizes and invokes its operations according to their readiness, priority level, and interoperation dependencies.
- If all of the queued operations have the same queuePriority and the ready property returns YES, the queue invokes them in the order you added them. Otherwise, the operation queue always invokes the operation with the highest priority relative to the other ready operations.

- However, don’t rely on queue semantics to ensure a specific execution order of operations because changes in the readiness of an operation can change the resulting execution order. 
- Interoperation dependencies provide an absolute execution order for operations, even if those operations are located in different operation queues. An operation object isn’t ready to run until all of its dependent operations have finished running.

## Respond to Operation Cancelation

- Finishing its task doesn’t necessarily mean that the operation performed that task to completion; an operation can also be canceled.
- Canceling an operation object leaves the object in the queue but notifies the object that it should stop its task as quickly as possible. For currently executing operations, this means that the operation object’s work code must check the cancellation state, stop what it is doing, and mark itself as finished.
- For operations that are queued but not yet executing, the queue must still call the operation object’s start method so that it can processes the cancellation event and mark itself as finished.

## Observe Operations Using Key-Value Observing

operations — Read-only

operationCount — Read-only

maxConcurrentOperationCount — Readable and writable

suspended — Readable and writable

name — Readable and writable

## Plan for Thread Safety
- You can safely use a single NSOperationQueue object from multiple threads without creating additional locks to synchronize access to that object.

- Operation queues use the Dispatch framework to initiate the execution of their operations. As a result, queues always invoke operations on a separate thread, regardless of whether the operation is synchronous or asynchronous.

# Example
```swift
    // 1. initialize NSOperationQueue instance
    let queue = OperationQueue()
    // 2. initialize NSBlockOperation instance - subClass of NSOperation
    let operation1 = BlockOperation(block: {
        print("Operation 1")
    })

    // 4. add completion block to operation
    operation1.completionBlock = {
        print("Operation 1 completed")
    }
    // 5. add NSOperation to NSOperationQueue
    queue.addOperation(operation1)

    let operation2 = BlockOperation(block: {
        print("Operation 2")
    })

    // 6. add dependency: operation 2 depend on operation 1
    operation2.addDependency(operation1)

    operation2.completionBlock = {
        print("Operation 2 completed")
    }

    queue.addOperation(operation2)

    //queue.cancelAllOperations()
```

https://developer.apple.com/documentation/foundation/nsoperationqueue

https://developer.apple.com/documentation/foundation/nsoperation



