//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/8/22.
//

import SwiftUI
import Inject

struct ContentView: View {
    @ObserveInjection var inject

    var body: some View {
        NavigationView {
            List(DinosaurService().dinosaurs) { dinosaur in
                NavigationLink {
                    // TODO: Add a detail view
                    Image(dinosaur.imageName)
                        .resizable()
                        .scaledToFit()
                } label: {
                    HStack {
                        Image(dinosaur.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)

                        VStack(alignment: .leading) {
                            Text(dinosaur.name)
                                .fontWeight(.bold)

                            Text(dinosaur.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(dinosaur.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Dinosaurs")
        }
        .enableInjection()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
