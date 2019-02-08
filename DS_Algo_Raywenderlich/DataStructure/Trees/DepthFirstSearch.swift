//
//  DepthFirstSearch.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 08/02/19.
//  Copyright © 2019 zerones. All rights reserved.
//

import Foundation
extension Graph {
    func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var stack: Stack<Vertex<Element>> = []
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        stack.push(source)
        pushed.insert(source)
        visited.append(source)

        outer: while let vertex = stack.peek() {
            let neighbors = edges(from: vertex)
            guard !neighbors.isEmpty else {
                stack.pop()
                continue
            }
            for edge in neighbors {
                if !pushed.contains(edge.destination) {
                    stack.push(edge.destination)
                    pushed.insert(edge.destination)
                    visited.append(edge.destination)
                    continue outer
                }
            }
            stack.pop()
        }

        return visited
    }
}
