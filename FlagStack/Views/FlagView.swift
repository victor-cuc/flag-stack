//
//  FlagView.swift
//  FlagStack
//
//  Created by Victor Cuc on 30/09/2021.
//

import SwiftUI

struct FlagView: View {
    @ObservedObject var flagViewModel: FlagViewModel
    
    var body: some View {
        draw(node: flagViewModel.root)
    }
    
    func draw(node: Section?) -> AnyView {
        if let node = node as? Stripe {
            return node.color.eraseToAnyView()
        } else if let stack = node as? Stack {
            let isCurrentSection = (stack == flagViewModel.currentStack ? true : false)
            return draw(stack: stack)
                .border(.yellow, width: isCurrentSection ? 2 : 0)
                .eraseToAnyView()
        } else {
            return EmptyView().eraseToAnyView()
        }
    }
    
    @ViewBuilder
    func draw(stack: Stack) -> some View {
        if stack.children.count == 0 {
            Color.gray
        } else {
            container(for: stack.orientation) {
                ForEach(stack.children, id: \.id) { node in
                    draw(node: node)
                }
            }
        }
    }
    
    @ViewBuilder
    func container<Content: View>(for orientation: Orientation, @ViewBuilder content: () -> Content) -> some View {
        switch orientation {
        case .horizontal:
            HStack(spacing:0) {
                content()
            }
        case .vertical:
            VStack(spacing:0) {
                content()
            }
        }
    }
}
