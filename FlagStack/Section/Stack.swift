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

class Stack: Section, ObservableObject, Identifiable {
    var orientation: Orientation
    @Published var children: [Section]
    
    var id: String = UUID().uuidString
    
    init(orientation: Orientation) {
        self.orientation = orientation
        self.children = []
    }
    
    init(orientation: Orientation, children: [Section]) {
        self.orientation = orientation
        self.children = children
    }
}
