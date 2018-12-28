//
//  File.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Iqbal on 12/20/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation

public struct Stack<Element> {
    private var storage = [Element]()
    
    public init() {}
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ value: Element) {
        storage.append(value)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-----------"
        let stackElements = storage
            .map { "\($0)" }
            .reversed()
            .joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
