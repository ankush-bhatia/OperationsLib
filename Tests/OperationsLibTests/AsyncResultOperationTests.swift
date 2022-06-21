//
//  AsyncResultOperationTests.swift
//  
//
//  Created by Ankush Bhatia on 21/06/22.
//

import XCTest
@testable import OperationsLib

class AsyncResultOperationTests: XCTestCase {

    private var sut: AsyncResultOperation<String, Error>?

    override func setUpWithError() throws {
        sut = AsyncResultOperation()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFinishSucess() {
        sut!.finish(with: .success(""))
        let result = sut!.result
        XCTAssertEqual(result, .success(""))
    }

    func testFinishFailure() {
        sut!.finish(with: .failure(Error.notFound))
        let result = sut!.result
        XCTAssertEqual(result, .failure(.notFound))
    }

    func testFinishWithCancel() {
        sut!.cancel(with: .notFound)
        sut!.finish()
        XCTAssertFalse(sut!.isExecuting)
        XCTAssertTrue(sut!.isFinished)
    }

    func testCancel() {
        sut!.cancel(with: .notFound)
        let result = sut!.result
        XCTAssertEqual(result, .failure(.notFound))
    }
}

extension AsyncResultOperationTests {

    enum Error: Swift.Error {

        case notFound
    }
}
