//
//  BinaryHeap.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 27/12/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation
/*
 A heap is a complete binary tree, also known as a binary heap, that can be constructed using an array.
 Heaps come in two flavors:
 1. Max heap, where elements with a higher value have a higher priority.
 2. Min heap, where elements with a lower value have a higher priority.

 Properties:
 1. In a max heap, parent nodes must always contain a value that is greater than or equal to the value in its children. The root node will always contain the highest value.
 2. In a min heap, parent nodes must always contain a value that is less than or equal to the value in its children. The root node will always contain the lowest value.
 3. Another important property of a heap is that it is a complete binary tree. This means that every level must be filled, except for the last level. It’s like a video game, where you can’t go to the next level until you have completed the current one.

 Some useful applications of a heap include:
 • Calculating the minimum or maximum element of a collection
 • Heap Sort
 • Constructing a priority queue
 • Constructing graph algorithms like Prim’s or Dijkstra’s with a priority queue.
 */
struct Heap<Element: Equatable> {
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        if !elements.isEmpty {
            //Number of parent = total number of elements / 2
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    func peek() -> Element? {
        return elements.first
    }

    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }

    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }

    //O(n)
    func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        if sort(element, elements[i]) {
            return nil
        }
        if element == elements[i] {
            return i
        }
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
    }

    //O(log(n))
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }

    //O(log(n))
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    //O(log(n))
    mutating func remove(at index: Int) -> Element? {
        guard index != count - 1 else {
            return nil
        }
        if index == count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }

    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if parent == candidate {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }

    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)

        while child > 0 && sort(elements[parent], elements[child]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
}
