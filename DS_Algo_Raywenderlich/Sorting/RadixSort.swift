//
//  RadixSort.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 04/01/19.
//  Copyright © 2019 zerones. All rights reserved.
//

import Foundation
extension Array where Element == Int {
    //88, 410, 1772, 20
    public mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            forEach { number in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                if remainingPart > 0 {
                    done = false
                }
            }
            digits *= base
            self = buckets.flatMap { $0 }
        }
    }
}
