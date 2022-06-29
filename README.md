# OperationsLib

![Version](https://img.shields.io/github/v/release/ankush-bhatia/OperationsLib?include_prereleases)
![Tests](https://github.com/ankush-bhatia/OperationsLib/actions/workflows/main.yml/badge.svg?branch=main)
![Issues](https://img.shields.io/github/issues/ankush-bhatia/OperationsLib)
![License](https://img.shields.io/github/license/ankush-bhatia/OperationsLib)
![Twitter](https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2Fankush-bhatia%2FOperationsLib)

OperationsLib is a OperationQueue based library written in swift for managing the asynchronous operations.

## Features

- [x] AsyncOperation handling
- [x] AsyncResultOperation handling.
- [x] ChainedAsyncResultOperation handling.

## Usage

### AsyncOperation

```swift
import OperationsLib

final class OperationA: AsyncOperation {
    // Add Async code here
}

final class OperationB: AsyncOperation {
    // Add Async code here
}

let operationQueue = OperationQueue()
let operationA = OperationA()
let operationB = OperationB()
operationB.addDependecy(operationA)
operationQueue = operationQueue.addOperations([operationA, operationB], waitUnitFinished: true)
```

### AsyncResultOperation

```swift
import OperationsLib

final class OperationA: AsyncResultOperation<CodableModelA, Error> {
    // Add Async code here
}

final class OperationB: AsyncResultOperation<CodableModelB, Error> {
    // Add Async code here
}

let operationQueue = OperationQueue()
let operationA = OperationA()
let operationB = OperationB()
operationB.addDependecy(operationA)
operationQueue = operationQueue.addOperations([operationA, operationB], waitUnitFinished: true)
```

### ChainedAsyncResultOperation

```swift
import OperationsLib

final class OperationA: AsyncResultOperation<CodableModelA, Error> {
    // Add Async code here
}

final class OperationB: ChainedAsyncResultOperation<CodableModelA, CodableModelB, Error> {
    // Add Async code here
}

final class OperationC: ChainedAsyncResultOperation<CodableModelB, CodableModelC, Error> {
    // Add Async code herex
}

let operationQueue = OperationQueue()
let operationA = OperationA()
let operationB = OperationB()
let operationC = OperationC()
operationB.addDependecy(operationA)
operationC.addDependecy(operationB)
operationQueue = operationQueue.addOperations([operationA, operationB, operationC], waitUnitFinished: true)

```

## Requirements

- iOS 12.0+ / macOS 10.14+ / tvOS 12.0+ / watchOS 5.0+ (if you use only UIKit/AppKit)
- Swift 5.0+

## Installation

#### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/ankush-bhatia/OperationsLib.git`
- Select "Branch" with "main"

#### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
use_frameworks!

target 'MyApp' do
  pod 'OperationsLib', '~> 0.0.1-beta.1'
end
```

#### Carthage

```
github "ankush-bhatia/OperationsLib" ~> 0.0.1-beta.1
```

