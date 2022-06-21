//
//  AsyncOperationTests.swift
//  
//
//  Created by Ankush Bhatia on 21/06/22.
//

import XCTest
@testable import OperationsLib

class AsyncOperationTests: XCTestCase {

    var sut: AsyncOperationAble?

    override func setUpWithError() throws {
        sut = AsyncOperation()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testIsTaskAsync() {
        let isAsynchronous = sut!.isAsynchronous
        XCTAssertTrue(isAsynchronous)
    }

    func testIsExecutingInitialState() {
        XCTAssertFalse(sut!.isExecuting)
    }

    func testIsFinishedInitialState() {
        XCTAssertFalse(sut!.isFinished)
    }

    func testFinish() {
        sut!.finish()
        XCTAssertFalse(sut!.isExecuting)
        XCTAssertTrue(sut!.isFinished)
    }

    func testFinishStateIfCancelled() {
        sut!.cancel()
        sut!.start()
        XCTAssertFalse(sut!.isExecuting)
        XCTAssertTrue(sut!.isFinished)
    }
}
