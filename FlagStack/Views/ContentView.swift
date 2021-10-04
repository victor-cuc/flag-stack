//
//  ContentView.swift
//  FlagStack
//
//  Created by Victor Cuc on 29/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectedColor: Color = .gray
    @StateObject var flagViewModel: FlagViewModel = FlagViewModel()

    var body: some View {
        VStack {
            FlagView(flagViewModel: flagViewModel)
                .frame(width: 200, height: 130, alignment: .center)
                .padding(EdgeInsets(top: 64, leading: 0, bottom: 32, trailing: 0))
            ScrollView {
                VStack {
                    VStack {        
                        HStack {
                            Button(action: {
                                flagViewModel.addStack(orientation: .horizontal)
                            }) {
                                Image(systemName: "line.horizontal.3.circle.fill")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color.gray)
                                    .rotationEffect(.degrees(90))
                            }
                            Button(action: {
                                flagViewModel.addStack(orientation: .vertical)
                            }) {
                                Image(systemName: "line.horizontal.3.circle.fill")
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .foregroundColor(Color.gray)
                            }
                            Button(action: {
                                flagViewModel.goUpASection()
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
                                flagViewModel.addStripe(color: selectedColor)
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
