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
        sortTest()
    }

    func sortTest() {
       /* example(of: "bubble sort") {
            var array = [9, 4, 10, 3]
            print("Original: \(array)")
            bubbleSort(&array)
            print("Bubble sorted: \(array)")
        }
        example(of: "selection sort") {
            var array = [9, 4, 10, 3]
            print("Original: \(array)")
            selectionSort(&array)
            print("Selection sorted: \(array)")
        }
        example(of: "insertion sort") {
            var array = [9, 4, 10, 3]
            print("Original: \(array)")
            insertionSort(&array)
            print("Insertion sorted: \(array)")
        }
        example(of: "merge sort") {
            let array = [7, 2, 6, 3, 9]
            print("Original: \(array)")
            print("Merge sorted: \(mergeSort(array))")
        }
        example(of: "radix sort") {
            var array = [88, 410, 1772, 20]
            print("Original array: \(array)")
            array.radixSort()
            print("Radix sorted: \(array)")
        }*/
        /*let heap = Heap(sort: >, elements: [6, 12, 2, 26, 8, 18, 21, 9, 5])
        print(heap.sorted())*/
        var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
        quickSortMedian(&list, low: 0, high: list.count - 1)
        print(list)
    }

    func priorityQueueTest() {
        var priorityQueue = PriorityQueue(sort: <, elements: [1,12,3,4,1,6,8,7])
        while !priorityQueue.isEmpty {
            print(priorityQueue.dequeue()!)
        }
    }

    func heapTest() {
        var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])
        while !heap.isEmpty {
            print(heap.remove()!)
        }
    }

    func searchTest() {
        let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
        let search31 = array.index(of: 31)
        let binarySearch31 = array.binarySearch(for: 31)
        print("index(of:): \(String(describing: search31))")
        print("binarySearch(for:): \(String(describing: binarySearch31))")
    }

    func trieTest() {
        example(of: "prefix matching") {
            let trie = Trie<String>()
            trie.insert("car")
            trie.insert("card")
            trie.insert("care")
            trie.insert("cared")
            trie.insert("cars")
            trie.insert("carbs")
            trie.insert("carapace")
            trie.insert("cargo")
            /*print("\nCollections starting with \"car\"")
            let prefixedWithCar = trie.collections(startingWith: "car")
            print(prefixedWithCar)*/
            print("\nCollections starting with \"care\"")
            let prefixedWithCare = trie.collections(startingWith: "care")
            print(prefixedWithCare)
        }
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
        /*var queue = QueueStack<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue.dequeue())
        print(queue)
        print(queue.peek)*/
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

