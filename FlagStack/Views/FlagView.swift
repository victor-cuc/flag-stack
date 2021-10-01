//
//  FlagView.swift
//  FlagStack
//
//  Created by Victor Cuc on 30/09/2021.
//

import SwiftUI

struct FlagView: View {
    @ObservedObject var root: Stack
    
    var body: some View {
        draw(node: root)
    }
    
    func draw(node: Section) -> AnyView {
        if let node = node as? Stripe {
            return node.color.eraseToAnyView()
        } else if let node = node as? Stack {
            switch node.orientation {
            case .horizontal:
                return HStack(spacing: 0) {
                    ForEach(node.children, id: \.id) { node in
                        draw(node: node)
                    }
                }.eraseToAnyView()
            case .vertical:
                return VStack(spacing: 0) {
                     ForEach(node.children, id: \.id) { node in
                         draw(node: node)
                     }
                }.eraseToAnyView()
            }
        } else {
            return EmptyView().eraseToAnyView()
        }
    }
}
