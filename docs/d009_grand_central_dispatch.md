# Dispatch, also known as Grand Central Dispatch (GCD)

## What
- Execute code concurrently on multicore hardware by submitting work to dispatch queues managed by the system.

## Why
- GCD contains language features, runtime libraries, and system enhancements that provide systemic, comprehensive improvements to the support for concurrent code execution on multicore hardware in macOS, iOS, watchOS, and tvOS.

## How

- Create queues or use GCD system queues to run tasks
```Swift
let mySerialQueue = dispatch_queue_create("com.framgia.serialQueue", DISPATCH_QUEUE_SERIAL)
```

### DISPATCH_QUEUE_SERIAL

Tasks added to a serial queue only can run 1 task at a time and they will do in order of FIFO

- DISPATCH_QUEUE_SERIAL: FIFO
```Swift
let mySerialQueue = dispatch_queue_create("com.framgia.serialQueue", DISPATCH_QUEUE_SERIAL)
let serialQueue = dispatch_queue_create("com.framgia.serialQueue", DISPATCH_QUEUE_SERIAL)

dispatch_async(serialQueue) { () -> Void in
    // Do task 1 code
}

dispatch_async(serialQueue) { () -> Void in
    // Do task 2 code
}

dispatch_async(serialQueue) { () -> Void in
    // Do task 3 code
}
```
- DISPATCH_QUEUE_SERIAL: Run tasks concurrency with different serial queues

Task 1 and task 3 can run concurrency with 2 queues

```swift
let serialQueue1 = dispatch_queue_create("com.framgia.serialQueue1", DISPATCH_QUEUE_SERIAL)

dispatch_async(serialQueue1) { () -> Void in
    // Do task 1 code
}

dispatch_async(serialQueue1) { () -> Void in
    // Do task 2 code
}

let serialQueue2 = dispatch_queue_create("com.framgia.serialQueue2", DISPATCH_QUEUE_SERIAL)

dispatch_async(serialQueue2) { () -> Void in
    // Do task 3 code
}
```

- GCD system queues - DISPATCH_QUEUE_SERIAL
```Swift
let mainQueue = dispatch_get_main_queue()
```

### DISPATCH_QUEUE_CONCURRENT
Tasks added to a concurrent queue execute concurrent, task first in will execute first.
```swift
let myConcurrentQueue = dispatch_queue_create("com.framgia.concurrentQueue", DISPATCH_QUEUE_CONCURRENT)
```

- GCD global concurrent queues

    - DISPATCH_QUEUE_PRIORITY_HIGH
    - DISPATCH_QUEUE_PRIORITY_DEFAULT
    - DISPATCH_QUEUE_PRIORITY_LOW
    - DISPATCH_QUEUE_PRIORITY_BACKGROUND

```swift
let myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
```

https://viblo.asia/p/concurrency-trong-ios-tim-hieu-ve-grand-central-dispatch-va-nsoperation-DljMbo8ZGVZn
