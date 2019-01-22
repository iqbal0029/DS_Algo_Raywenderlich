//
//  QuicksortLomuto.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 22/01/19.
//  Copyright © 2019 zerones. All rights reserved.
//

import Foundation
public func partitionLomuto<T: Comparable>(_ a: inout [T],
                                           low: Int, high: Int) -> Int {
    var i = low
    let pivot = a[high]
    for j in low..<high {
        if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
        }
    }
    a.swapAt(i, high)
    return i
}

public func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
    }
}
