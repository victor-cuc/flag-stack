//
//  Flag.swift
//  FlagStack
//
//  Created by Victor Cuc on 04/10/2021.
//

import SwiftUI

class FlagViewModel: ObservableObject {
    var root: Stack? = nil
    var currentStack: Stack? = nil
    
    func goUpASection() {
        guard let parentStack = currentStack?.parentStack else {
            print("You've reached the root")
            return
        }
        currentStack = parentStack
        print("Moved up a section.")
        self.objectWillChange.send()
    }
    
    func addStripe(color: Color) {
        guard let currentStack = currentStack else {
            print("Add a stack first")
            return
        }
        let stripe = Stripe(color: color)
        currentStack.children.append(stripe)
        print("Added stripe")
        self.objectWillChange.send()
    }
    
    func addStack(orientation: Orientation) {
        let newStack = Stack(orientation: orientation, parentStack: currentStack)
        
        if currentStack != nil {
            currentStack!.children.append(newStack)
            currentStack! = newStack
            print("Added \(orientation) stack")
        } else {
            root = newStack
            currentStack = newStack
        }
        self.objectWillChange.send()
    }
}
