//
//  Stack.swift
//  FlagStack
//
//  Created by Victor Cuc on 30/09/2021.
//

import SwiftUI

enum Orientation {
    case horizontal
    case vertical
}

class Stack: Section, Identifiable, Equatable {
    
    var id: String = UUID().uuidString
    var orientation: Orientation
    var parentStack: Stack?
    var children: [Section]
    
    init(orientation: Orientation) {
        self.orientation = orientation
        self.parentStack = nil
        self.children = []
    }
    
    init(orientation: Orientation, parentStack: Stack?) {
        self.orientation = orientation
        self.parentStack = parentStack
        self.children = []
    }
    
    static func == (lhs: Stack, rhs: Stack) -> Bool {
        return lhs.id == rhs.id
    }

//    init(orientation: Orientation, children: [Section]) {
//        self.orientation = orientation
//        self.parentStack = nil
//        self.children = children
//    }
}
