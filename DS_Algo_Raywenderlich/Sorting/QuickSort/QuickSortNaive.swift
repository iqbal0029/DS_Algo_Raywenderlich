//
//  QuickSort.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 22/01/19.
//  Copyright © 2019 zerones. All rights reserved.
//

import Foundation
public func quicksortNaive<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {
        return a
    }

    let pivot = a[a.count / 2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    return quicksortNaive(less) + equal + quicksortNaive(greater)
}
