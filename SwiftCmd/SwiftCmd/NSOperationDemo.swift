//
//  NSOperationDemo.swift
//  SwiftCmd
//
//  Created by Nguyễn Hoàng Văn Nhã on 5/18/22.
//

import Foundation

func nsOperationDemo() {
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

}
