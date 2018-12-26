//
//  Trie.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Iqbal on 12/26/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation
public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    public typealias Node = TrieNode<CollectionType.Element>
    public var root = Node(key: nil, parent: nil)
    public init() {}
}

extension Trie {
    public func insert(_ collection: CollectionType) {
        var current = root
        for element in collection {
            if current.childrens[element] == nil {
                current.childrens[element] = Node(key: element, parent: current)
            }
            current = current.childrens[element]!
        }
        current.isTerminating = true
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.childrens[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        var current = root
        for element in collection {
            guard let child = current.childrens[element] else {
                return
            }
            current = child
        }
        guard current.isTerminating else {
            return
        }
        current.isTerminating = false
        while let parent = current.parent, parent.childrens.isEmpty, !parent.isTerminating {
                parent.childrens[current.key!] = nil
                current = parent
        }
    }
}
