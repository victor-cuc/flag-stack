//
//  Stripe.swift
//  FlagStack
//
//  Created by Victor Cuc on 30/09/2021.
//

import SwiftUI

class Stripe: Section, Identifiable{
    var color: Color = .gray
    var emblem: Image? = nil
    
    var id: String = UUID().uuidString
    
    init(color: Color) {
        self.color = color
    }
}
