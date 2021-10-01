//
//  ContentView.swift
//  FlagStack
//
//  Created by Victor Cuc on 29/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    private var root: Stack = Stack(orientation: .horizontal)
//        , children:
//        [
//            Stack(orientation: .vertical, children: [
//                Stripe(color: .blue),
//                Stack(orientation: .vertical, children: [
//                    Stripe(color: .red),
//                    Stripe(color: .white),
//                    Stripe(color: .red),
//                    Stripe(color: .white),
//                    Stripe(color: .red),
//                    Stripe(color: .white),
//                    Stripe(color: .red),
//                    Stripe(color: .white),
//                ])
//            ]),
//            Stack(orientation: .vertical, children: [
//                Stripe(color: .red),
//                Stripe(color: .white),
//                Stripe(color: .red),
//                Stripe(color: .white),
//                Stripe(color: .red),
//                Stripe(color: .white),
//                Stripe(color: .red),
//                Stripe(color: .white),
//                Stripe(color: .red),
//                Stripe(color: .white),
//                Stripe(color: .red),
//                Stripe(color: .white),
//                Stripe(color: .red),
//                Stripe(color: .white),
//                Stripe(color: .red),
//                Stripe(color: .white),
//            ])
//        ]
    
    var body: some View {
        root.draw()
        Button(action: {
            root.children.append(Stripe(color: .green))
        }) {
            Text("HStack")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
