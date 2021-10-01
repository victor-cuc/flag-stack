//
//  ContentView.swift
//  FlagStack
//
//  Created by Victor Cuc on 29/09/2021.
//

import SwiftUI

struct ContentView: View {
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

    @State var selectedColor: Color = .gray
    @State var currentStack: Stack? = nil
    
    var body: some View {
        VStack {
            FlagView(root: root)
                .frame(width: 200, height: 130, alignment: .center)
                .padding(EdgeInsets(top: 64, leading: 0, bottom: 32, trailing: 0))
            ScrollView {
                VStack {
                    ExtractedView(root: root, selectedColor: $selectedColor)
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
    @Binding var selectedColor: Color
    
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
                ColorPicker("", selection: $selectedColor)
                    .labelsHidden()
                    .frame(width: 48, height: 48, alignment: .center)
                    .scaleEffect(1.7)
                Button(action: {
                    root.children.append(Stripe(color: selectedColor))
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.gray)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
}
