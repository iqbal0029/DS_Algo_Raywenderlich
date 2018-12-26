//
//  TrieNode.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Iqbal on 12/23/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation
public class TrieNode<Key: Hashable> {
    public var key: Key?
    public weak var parent: TrieNode?
    public var childrens: [Key: TrieNode] = [:]
    public var isTerminating = false
    
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
