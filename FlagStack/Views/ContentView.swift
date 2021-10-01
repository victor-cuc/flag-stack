//
//  ContentView.swift
//  FlagStack
//
//  Created by Victor Cuc on 29/09/2021.
//

import SwiftUI

struct ContentView: View {

    @State var selectedColor: Color = .yellow
    @StateObject private var root: Stack = Stack(orientation: .horizontal
        , children:
        [
            Stack(orientation: .vertical, children: [
                Stripe(color: .blue),
                Stack(orientation: .vertical, children: [
                    Stripe(color: .white),
                    Stripe(color: .red),
                    Stripe(color: .white),
                    Stripe(color: .red),
                    Stripe(color: .white),
                    Stripe(color: .red),
                    Stripe(color: .white),
                    Stripe(color: .red),
                    Stripe(color: .white),
                ])
            ]),
            Stack(orientation: .vertical, children: [
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
                Stripe(color: .red),
                Stripe(color: .white),
            ])
        ]
    )
    
    var body: some View {
        VStack {
            FlagView(root: root)
                .frame(width: 200, height: 130, alignment: .center)
                .padding(EdgeInsets(top: 64, leading: 0, bottom: 32, trailing: 0))
            ScrollView {
                VStack {
                    ExtractedView(root: root)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    @ObservedObject var root: Stack
    
    var body: some View {
        VStack {
//            Text("ADD SUBSECTION")
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "line.horizontal.3.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.gray)
                        .rotationEffect(.degrees(90))
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "line.horizontal.3.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.gray)
                }
                Button(action: {
                   
                }) {
                    Image(systemName: "arrow.uturn.backward.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.gray)
                }
            }
            HStack {
                Button(action: {
                    
                }) {
                    Circle()
                        .fill(
                            AngularGradient(colors: [.red, .yellow, .blue, .purple], center: .center)
                        )
                        .frame(width: 48, height: 48)
                }
                Button(action: {
                    root.children.append(Stripe(color: .yellow))
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.yellow)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}
