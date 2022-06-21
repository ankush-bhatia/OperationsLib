//
//  AsyncResultOperation.swift
//  
//
//  Created by Ankush Bhatia on 20/06/22.
//

import Foundation

open class AsyncResultOperation<Success, Failure>: AsyncOperation where Failure: Error {

    private(set) var result: Result<Success, Failure>?

    override public func finish() {
        guard !isCancelled else {
            return super.finish()
        }
        fatalError("Make use of finish(with:) instead.")
    }

    override public func cancel() {
        fatalError("Make use of cancel(with:) instead.")
    }

    public func finish(with result: Result<Success, Failure>) {
        self.result = result
        super.finish()
    }

    public func cancel(with error: Failure) {
        self.result = .failure(error)
        super.cancel()
    }
}
