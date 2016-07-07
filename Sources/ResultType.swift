//
//  ResultType.swift
//  Interstellar
//
//  Created by Jens Ravens on 10/12/15.
//  Copyright © 2015 nerdgeschoss GmbH. All rights reserved.
//

public protocol ResultType {
    associatedtype Value

    var error: ErrorProtocol? { get }
    var value: Value? { get }

    var result: Result<Value> { get }
}

extension Result {
    public init(value: T?, error err: ErrorProtocol?) {
        if let err = err {
            self = .error(err)
        } else {
            self = .success(value!)
        }
    }

    public init(block: (Void) throws -> T) {
        do {
            self = try .success(block())
        } catch let e {
            self = .error(e)
        }
    }

    public var result: Result<T> {
        return self
    }
}