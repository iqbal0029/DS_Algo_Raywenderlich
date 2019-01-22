//
//  HeapSort.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 22/01/19.
//  Copyright © 2019 zerones. All rights reserved.
//

import Foundation
extension Heap {
    mutating func siftDown(from index: Int, upTo size: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < size && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < size && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    func sorted() -> [Element] {
        var heap = Heap(sort: sort, elements: elements) // 1
        for index in heap.elements.indices.reversed() { // 2
            heap.elements.swapAt(0, index) // 3
            heap.siftDown(from: 0, upTo: index) // 4
        }
        return heap.elements
    }
}
