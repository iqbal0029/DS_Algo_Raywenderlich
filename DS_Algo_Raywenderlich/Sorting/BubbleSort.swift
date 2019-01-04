//
//  BubbleSort.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 28/12/18.
//  Copyright © 2018 zerones. All rights reserved.
//

public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    for end in (1..<array.count).reversed() {
        var swapped = false
        for current in 0 ..< end {
            if array[current] > array[current+1] {
                array.swapAt(current, current+1)
                swapped = true
            }
        }
        if !swapped {
            return
        }
    }

}

public func bubbleSort<T>(_ array: inout T)
    where T: MutableCollection, T.Element: Comparable {
        guard array.count >= 2 else {
            return
        }
        for end in array.indices.reversed() {
            var swapped = false
            var current = array.startIndex
            while current < end {
                let next = array.index(after: current)
                if array[current] > array[next] {
                    array.swapAt(current, next)
                    swapped = true
                }
                current = next
            }
            if !swapped {
                return
            }
        }
}
