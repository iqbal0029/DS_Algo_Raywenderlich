//
//  AppDelegate.swift
//  DS_Algo_Raywenderlich
//
//  Created by Faisal Iqbal on 12/15/18.
//  Copyright © 2018 zerones. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        treeTest()
    }

    func treeTest() {
        func makeBeverageTree() -> TreeNode<String> {
            let tree = TreeNode("Beverages")
            let hot = TreeNode("hot")
            let cold = TreeNode("cold")
            let tea = TreeNode("tea")
            let coffee = TreeNode("coffee")
            let chocolate = TreeNode("cocoa")
            let blackTea = TreeNode("black")
            let greenTea = TreeNode("green")
            let chaiTea = TreeNode("chai")
            let soda = TreeNode("soda")
            let milk = TreeNode("milk")
            let gingerAle = TreeNode("ginger ale")
            let bitterLemon = TreeNode("bitter lemon")
            tree.add(hot)
            tree.add(cold)
            hot.add(tea)
            hot.add(coffee)
            hot.add(chocolate)
            cold.add(soda)
            cold.add(milk)
            tea.add(blackTea)
            tea.add(greenTea)
            tea.add(chaiTea)
            soda.add(gingerAle)
            soda.add(bitterLemon)
            return tree
        }

        example(of: "searching for a node") {
            let tree = makeBeverageTree()
            if let searchResult1 = tree.search("ginger ale") {
                print("Found node: \(searchResult1.value)")
            }
            if let searchResult2 = tree.search("WKD Blue") {
                print(searchResult2.value)
            } else {
                print("Couldn't find WKD Blue")
            }
        }
    }

    func queueTest() {
        var queue = QueueStack<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue.dequeue())
        print(queue)
        print(queue.peek)
    }
    
    func linkListTest() {
        example(of: "linked list cow") {
            var list1 = LinkedList<Int>()
            list1.append(1)
            list1.append(2)
            var list2 = list1
            print("List1: \(list1)")
            print("List2: \(list2)")
            print("After appending 3 to list2")
            list2.append(3)
            print("List1: \(list1)")
            print("List2: \(list2)")
        }
    }
    
    func stackTest() {
        example(of: "initializing a stack from an array literal") {
            var stack: Stack = [1.0, 2.0, 3.0, 4.0]
            print(stack)
            stack.pop()
        }
    }
    
}

