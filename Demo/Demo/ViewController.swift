//
//  ViewController.swift
//  Demo
//
//  Created by Ankush Bhatia on 26/06/22.
//

import UIKit
import OperationsLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let operationQueue = OperationQueue()
        let operation1 = TestOperation1()
        let operation2 = TestOperation2()
        operation2.addDependency(operation1)
        operationQueue.addOperations([operation1, operation2], waitUntilFinished: true)
        print("All Operations finished.")
    }
}

class TestOperation1: AsyncOperation {
    
    override func main() {
        print("Started 1")
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4)) {
            print("Finished 1")
            self.finish()
        }
    }
}

class TestOperation2: AsyncOperation {
    
    override func main() {
        print("Started 2")
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
            print("Finished 2")
            self.finish()
        }
    }
}
