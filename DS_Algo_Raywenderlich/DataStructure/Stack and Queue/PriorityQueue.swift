//
//  PriorityQueue.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 28/12/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation
struct PriorityQueue<Element: Equatable>: Queue {
    private var heap: Heap<Element>
    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    var peek: Element? {
        return heap.peek()
    }

    //O(log(n))
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }

    //O(log(n))
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
}
