//
//  BinarySearchTree.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Iqbal on 12/21/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation

public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    public init() {}
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    public func contains(_ value: Element) -> Bool {
        var curr = root
        
        while let node = curr {
            if node.value == value {
                return true
            }
            if value < node.value {
                curr = node.leftChild
            } else {
                curr = node.rightChild
            }
        }
        return false
    }
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }

}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        return root?.description ?? "empty tree"
    }
}

extension BinarySearchTree {
    private func insert(from node: BinaryNode<Element>?, value: Element)
        -> BinaryNode<Element> {
            guard let node = node else {
                return BinaryNode(value: value)
            }
            
            if value < node.value {
                node.leftChild = insert(from: node.leftChild, value: value)
            } else {
                node.rightChild = insert(from: node.rightChild, value: value)
            }
            return node
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element)
        -> BinaryNode<Element>? {
            guard let node = node else {
                return nil
            }
            
            if node.value == value {
                //Leaf Node
                if node.isEmpty {
                    return nil
                }
                
                //Having only one node
                if node.leftChild == nil {
                    return node.rightChild
                }
                if node.rightChild == nil {
                    return node.leftChild
                }
                
                //Having both child
                node.value = node.rightChild!.min.value
                node.rightChild = remove(node: node.rightChild, value: node.value)
                
            } else if value < node.value {
                node.leftChild = remove(node: node.leftChild, value: value)
            } else {
                node.rightChild = remove(node: node.rightChild, value: value)
            }
            return node
    }
}
