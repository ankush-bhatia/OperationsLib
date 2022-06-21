//
//  ChainedAsyncResultOperation.swift
//  
//
//  Created by Ankush Bhatia on 20/06/22.
//

import Foundation

public protocol ChainedOperationOutputProviding {

    var output: Any? { get }
}

protocol ChainedAsyncResultOperationAble {

    func updateFromInputDepedencies()
}

extension ChainedAsyncResultOperation: ChainedOperationOutputProviding {

    public var output: Any? {
        try? result?.get()
    }
}

open class ChainedAsyncResultOperation<Input, Output, Failure>: AsyncResultOperation<Output, Failure> where Failure: Swift.Error {

    private(set) var input: Input?

    public init(input: Input? = nil) {
        self.input = input
    }

    override public func start() {
        updateFromInputDepedencies()
        super.start()
    }

    func updateFromInputDepedencies() {
        guard input == nil else {
            return
        }
        input = dependencies.compactMap { operation in
            return (operation as? ChainedOperationOutputProviding)?.output as? Input
        }.first
    }
}
