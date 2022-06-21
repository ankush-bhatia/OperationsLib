//
//  AsyncOperation.swift
//  
//
//  Created by Ankush Bhatia on 20/06/22.
//

import Foundation

protocol AsyncOperationAble: Operation {

    func finish()
}

open class AsyncOperation: Operation, AsyncOperationAble {

    /// Lock Queue will make sure that the write operations are serialised and removes the race conditions.
    private let lockQueue = DispatchQueue(label: Queue.asyncOperation.name, attributes: .concurrent)

    /// This property should return true in case the async code needs to be handled under operation queue.
    override open var isAsynchronous: Bool {
        true
    }

    /// `isExecuting` tells us about the status of the execution of the task under the operation.
    private var _isExecuting: Bool = false
    override public var isExecuting: Bool {
        get {
            return lockQueue.sync {
                _isExecuting
            }
        }
        set {
            willChangeValue(forKey: "isExecuting")
            lockQueue.sync(flags: [.barrier]) {
                _isExecuting = newValue
            }
            didChangeValue(forKey: "isExecuting")
        }
    }

    /// `isFinished` tells us about the completion state of the operation.
    private var _isFinished: Bool = false
    override public var isFinished: Bool {
        get {
            return lockQueue.sync {
                _isFinished
            }
        }
        set {
            willChangeValue(forKey: "isFinished")
            lockQueue.sync(flags: [.barrier]) {
                _isFinished = newValue
            }
            didChangeValue(forKey: "isFinished")
        }
    }

    /// Starting point of the operation. Usually start is called automatically by the `Operation`. But here we are overriding to make sure we can handle the Operation states manually.
    override public func start() {
        // If the operation is cancelled we need to stop the process initialisation and as per the documentation we need to call the finish method as well.
        guard !isCancelled else {
            finish()
            return
        }
        isFinished = false
        isExecuting = true
        main()
    }

    /// Subclass should override the main function to write the operation that we want to execute.
    override open func main() {
        fatalError("Subclass should override main and implement the execution.")
    }

    /// `Finish` will make sure that the state of the Operation resets to origin state.
    public func finish() {
        isExecuting = false
        isFinished = true
    }
}
