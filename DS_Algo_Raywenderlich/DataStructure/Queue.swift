//
//  Queue.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Iqbal on 12/20/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

public struct QueueArray<T>: Queue {
    private var storage = [T]()
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var peek: Element? {
        return storage.first
    }
    
    @discardableResult
    mutating public func enqueue(_ element: T) -> Bool {
        //O(1)
        storage.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        //O(n)
        return isEmpty ? nil : storage.removeFirst()
    }

}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return storage.description
    }
}

//MARK: QueueLinkedList
public class QueueLinkedList<T>: Queue {
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let first = list.first else {
            return nil
        }
        return list.remove(first)
    }
    
    public var peek: T? {
        return list.first?.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

//MARK: QueueRingBuffer
public struct QueueRingBuffer<T>: Queue {
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    public var peek: T? {
        return ringBuffer.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        return ringBuffer.read()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        return ringBuffer.description
    }
}

//MARK: QueueStack

public struct QueueStack<T>: Queue {
    private var leftStack = [T]()
    private var rightStack = [T]()
    
    public init() {}
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    public var description: String {
        let printList = leftStack + rightStack.reversed()
        return printList.description
    }
}
