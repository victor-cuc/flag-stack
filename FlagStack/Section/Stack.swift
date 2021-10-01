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

class Stack: Section, ObservableObject {
    var orientation: Orientation
    @Published var children: [Section]
    
    init(orientation: Orientation) {
        self.orientation = orientation
        self.children = []
    }
    
    init(orientation: Orientation, children: [Section]) {
        self.orientation = orientation
        self.children = children
    }
    
    func draw() -> AnyView {
        switch orientation {
        case .horizontal:
            return HStack {
                ForEach(0..<children.count) { i in
                    let child = self.children[i]
                    child.draw()
                }
            }.eraseToAnyView()
        case .vertical:
            return VStack {
                ForEach(0..<children.count) { i in
                    let child = self.children[i]
                    child.draw()
                }
            }.eraseToAnyView()
        }
    }
}
