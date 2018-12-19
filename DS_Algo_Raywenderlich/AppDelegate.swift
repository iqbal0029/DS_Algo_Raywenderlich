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
        example(of: "removing the last node") {
            var list = LinkedList<Int>()
            list.push(3)
            list.push(2)
            list.push(1)
            print("Before removing last node: \(list)")
            let removedValue = list.removeLast()
            print("After removing last node: \(list)")
            print("Removed value: " + String(describing: removedValue))
        }
    }
}

