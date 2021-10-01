//
//  File.swift
//  FlagStack
//
//  Created by Victor Cuc on 30/09/2021.
//

import SwiftUI

//enum Section {
//    case stack(Stack)
//    case stripe(Stripe)
//}

protocol Section {
    func draw() -> AnyView
}
