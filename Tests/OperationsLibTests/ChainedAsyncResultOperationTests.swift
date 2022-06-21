//
//  ChainedAsyncResultOperationTests.swift
//  
//
//  Created by Ankush Bhatia on 21/06/22.
//

import XCTest
@testable import OperationsLib

class ChainedAsyncResultOperationTests: XCTestCase {

    private var sut: ChainedAsyncResultOperation<String, String, ChainedAsyncResultOperationTests.Error>?

    override func setUpWithError() throws {
        sut = ChainedAsyncResultOperation(input: nil)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testOutputWithoutAnyInput() {
        let result = sut!.output
        XCTAssertNil(result)
    }

    func testUpdateFromInputDepedencies() {
        let operation = ChainedAsyncResultOperation<URL, String, Error>()
        sut!.addDependency(operation)
        operation.finish(with: .success(""))
        sut!.updateFromInputDepedencies()
        XCTAssertEqual(sut!.input, "")
    }
}

extension ChainedAsyncResultOperationTests {

    enum Error: Swift.Error {

        case notFound
    }
}
