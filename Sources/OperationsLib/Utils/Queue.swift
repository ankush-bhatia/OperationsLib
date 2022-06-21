//
//  Queue.swift
//  
//
//  Created by Ankush Bhatia on 21/06/22.
//

import Foundation

enum Queue: String {

    case asyncOperation = "operationslib.queue.asyncOperation"

    var name: String {
        rawValue
    }
}
