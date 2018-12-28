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

public extension Trie where CollectionType: RangeReplaceableCollection {
    func collections(startingWith prefix: CollectionType) -> [CollectionType]
    {
        var current = root
        for element in prefix {
            guard let child = current.childrens[element] else {
                return []
            }
            current = child
        }
        return collections(startingWith: prefix, after: current)
    }

    private func collections(startingWith prefix: CollectionType,
                             after node: Node) -> [CollectionType] {
        var result: [CollectionType] = []
        if node.isTerminating {
            result.append(prefix)
        }
        for child in node.childrens.values {
            var prefix = prefix
            prefix.append(child.key!)
            result.append(contentsOf: collections(startingWith: prefix, after: child))
        }
        return result
    }
}
