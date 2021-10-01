//
//  Utils.swift
//  FlagStack
//
//  Created by Victor Cuc on 30/09/2021.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(erasing: self)
    }
}

