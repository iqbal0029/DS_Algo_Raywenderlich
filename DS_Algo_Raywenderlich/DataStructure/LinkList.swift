//
//  LinkList.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 17/12/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation

public class Node<Value> {
    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next) + " "
    }
}

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public init() {}

    public var isEmpty:Bool {
        return head == nil
    }

    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }

    public func node(at index: Int) -> Node<Value>? {
        var index = index
        var currentNode = head
        while index > 0 && currentNode != nil {
            currentNode = currentNode!.next
            index -= 1
        }
        return currentNode
    }

    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }

    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    @discardableResult
    public mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }

        guard head.next == nil else {
            return pop()
        }
        
        var prev = head
        var curr = head
        while let next = curr.next {
            prev = curr
            curr = next
        }
        prev.next = nil
        tail = prev
        return curr.value

    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}
