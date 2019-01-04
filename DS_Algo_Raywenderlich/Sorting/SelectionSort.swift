//
//  SelectionSort.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 28/12/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation
public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    for current in 0..<(array.count-1) {
        var lowest = current
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        if current != lowest {
            array.swapAt(lowest, current)
        }
    }
}
public func selectionSort<T>(_ collection: inout T)
    where T: MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }
    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)
        while other < collection.endIndex {
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
        }
        if lowest != current {
            collection.swapAt(lowest, current)
        }
    }
}
