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
        var exampleTree: BinarySearchTree<Int> {
            var bst = BinarySearchTree<Int>()
            bst.insert(3)
            bst.insert(1)
            bst.insert(4)
            bst.insert(0)
            bst.insert(2)
            bst.insert(5)
            return bst
        }

        example(of: "repeated insertions in sequence") {
            var tree = AVLTree<Int>()
            for i in 0..<15 {
                tree.insert(i)
            }
            print(tree)
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

