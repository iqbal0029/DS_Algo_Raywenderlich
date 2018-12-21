//
//  TreeNode.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 21/12/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []

    public init(_ value: T) {
        self.value = value
    }

    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> ()) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }

    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = QueueArray<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }

    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
