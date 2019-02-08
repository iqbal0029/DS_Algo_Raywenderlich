//
//  AdjacencyList.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Ikwal on 01/02/19.
//  Copyright © 2019 zerones. All rights reserved.
//

import Foundation
public class AdjacencyList<T>: Graph {
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}

    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }

    public func addDirectedEdge(from source: Vertex<T>,
                                to destination: Vertex<T>,
                                weight: Double?) {
        let edge = Edge(source: source,
                        destination: destination,
                        weight: weight)
        adjacencies[source]?.append(edge)
    }

    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }

    public func weight(from source: Vertex<T>,
                       to destination: Vertex<T>) -> Double? {
        return edges(from: source)
                .first { $0.destination == destination }?
                .weight
    }
}

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n")
        }
        return result
    }
}
/*
 If there are few edges in your graph, it is considered a sparse graph, and an adjacency list would be a good fit. An adjacency matrix would be a bad choice for a sparse graph, because lots of memory will be wasted since there aren't many edges.
If your graph has lots of edges, it's considered a dense graph, and an adjacency matrix
 would be a better fit as you'd be able to access your weights and edges far more quickly.
 */
