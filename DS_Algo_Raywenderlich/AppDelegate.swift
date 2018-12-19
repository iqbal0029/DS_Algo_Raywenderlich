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
        linkListTest()
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
}

