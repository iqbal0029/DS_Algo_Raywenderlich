// Copyright (c) 2018 Razeware LLC
// For full license & permission details, see LICENSE.markdown.


public class DNode<T> {
  
  public var value: T
  public var next: DNode<T>?
  public var previous: DNode<T>?
  
  public init(value: T) {
    self.value = value
  }
}

extension DNode: CustomStringConvertible {
  
  public var description: String {
    return String(describing: value)
  }
}

public class DoublyLinkedList<T> {
  
  private var head: DNode<T>?
  private var tail: DNode<T>?
  
  public init() { }
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public var first: DNode<T>? {
    return head
  }
  
  public func append(_ value: T) {
    let newNode = DNode(value: value)
    
    guard let tailNode = tail else {
      head = newNode
      tail = newNode
      return
    }
    
    newNode.previous = tailNode
    tailNode.next = newNode
    tail = newNode
  }
  
  public func remove(_ node: DNode<T>) -> T {
    let prev = node.previous
    let next = node.next
    
    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }
    
    next?.previous = prev
    
    if next == nil {
      tail = prev
    }
    
    node.previous = nil
    node.next = nil
    
    return node.value
  }
}

extension DoublyLinkedList: CustomStringConvertible {
  
  public var description: String {
    var string = ""
    var current = head
    while let node = current {
      string.append("\(node.value) -> ")
      current = node.next
    }
    return string + "end"
  }
}

public class LinkedListIterator<T>: IteratorProtocol {
  
  private var current: DNode<T>?
  
  init(node: DNode<T>?) {
    current = node
  }
  
  public func next() -> DNode<T>? {
    defer { current = current?.next }
    return current
  }
}

extension DoublyLinkedList: Sequence {
  
  public func makeIterator() -> LinkedListIterator<T> {
    return LinkedListIterator(node: head)
  }
}
