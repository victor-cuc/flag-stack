//
//  Stripe.swift
//  FlagStack
//
//  Created by Victor Cuc on 30/09/2021.
//

import SwiftUI

class Stripe: Section {
    var color: Color = .gray
    var emblem: Image? = nil
    
    init(color: Color) {
        self.color = color
    }
    
    func draw() -> AnyView {
        return color.eraseToAnyView()
    }
}
