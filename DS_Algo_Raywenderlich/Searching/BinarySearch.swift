//
//  BinarySearch.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 27/12/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation
extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let mid = index(range.lowerBound, offsetBy: size/2)
        if self[mid] == value {
            return mid
        } else if self[mid] > value {
            return binarySearch(for: value, in: range.lowerBound..<mid)
        } else {
            return binarySearch(for: value, in: index(after: mid)..<range.upperBound)
        }
    }
}
