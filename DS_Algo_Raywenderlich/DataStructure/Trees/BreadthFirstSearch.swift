//
//  BreadthFirstSearch.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 08/02/19.
//  Copyright © 2019 zerones. All rights reserved.
//

import Foundation
extension Graph {
    /*
     When traversing a graph using breadth-first search, each vertex is enqueued once. This has a time complexity of O(V) . During this traversal, you also visit all the the edges. The time it takes to visit all edges is O(E) . This means the overall time complexity for breadth-first search is O(V + E).
     The space complexity of BFS is O(V) since you have to store the vertices in three separate structures: queue, enqueued and visited.
     */

    func breadthFirstSearch(from source: Vertex<Element>)
        -> [Vertex<Element>] {
            var queue = QueueStack<Vertex<Element>>()
            var enqueued: Set<Vertex<Element>> = []
            var visited: [Vertex<Element>] = []

            _ = queue.enqueue(source)
            enqueued.insert(source)
            while let vertex = queue.dequeue() {
                visited.append(vertex)
                let neighbourEdges = edges(from: vertex)
                neighbourEdges.forEach { edge in
                    if !enqueued.contains(edge.destination) {
                        _ = queue.enqueue(edge.destination)
                        enqueued.insert(edge.destination)
                    }
                }
            }
            return visited
    }
}

func breadthFirstSearchTest() {
    let graph = AdjacencyList<String>()
    let a = graph.createVertex(data: "A")
    let b = graph.createVertex(data: "B")
    let c = graph.createVertex(data: "C")
    let d = graph.createVertex(data: "D")
    let e = graph.createVertex(data: "E")
    let f = graph.createVertex(data: "F")
    let g = graph.createVertex(data: "G")
    let h = graph.createVertex(data: "H")

    graph.add(.undirected, from: a, to: b, weight: nil)
    graph.add(.undirected, from: a, to: c, weight: nil)
    graph.add(.undirected, from: a, to: d, weight: nil)
    graph.add(.undirected, from: b, to: e, weight: nil)
    graph.add(.undirected, from: c, to: f, weight: nil)
    graph.add(.undirected, from: c, to: g, weight: nil)
    graph.add(.undirected, from: e, to: h, weight: nil)
    graph.add(.undirected, from: e, to: f, weight: nil)
    graph.add(.undirected, from: f, to: g, weight: nil)

    let vertices = graph.breadthFirstSearch(from: a)
    vertices.forEach { vertex in
        print(vertex)
    }

}

