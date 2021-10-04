//
//  ContentView.swift
//  FlagStack
//
//  Created by Victor Cuc on 29/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selectedColor: Color = .gray
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
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
                            Button (action: {
                                self.showingImagePicker = true
                            }) {
                                if image != nil {
                                    image?
                                        .resizable()
                                        .frame(width: 48, height: 48, alignment: .center)
                                        .cornerRadius(.infinity)
                                        .overlay(
                                            Image(systemName: "plus.circle")
                                                .resizable()
                                                .frame(width: 48, height: 48)
                                                .foregroundColor(Color.gray.opacity(0.7))
                                        )
                                } else {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                        .foregroundColor(Color.gray)
                                }
                            }
                            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                                ImagePicker(image: self.$inputImage)
                            }

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
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
