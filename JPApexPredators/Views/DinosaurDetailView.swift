//
//  DinosaurDetailView.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/2.
//

import Inject
import SwiftUI

struct DinosaurDetailView: View {
    @ObserveInjection var inject
    let dinosaur: Dinosaur

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // MARK: background image
                    Image(dinosaur.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(
                                stops: [
                                    .init(color: .clear, location: 0.8),
                                    .init(color: .black, location: 1)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }

                    // MARK: dinosaur image
                    Image(dinosaur.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3)
                        .scaleEffect(x: -1)
                        .offset(y: 20)
                        .shadow(color: .black, radius: 7)
                }

                VStack(alignment: .leading, spacing: 10) {
                    // MARK: dinosaur name
                    Text(dinosaur.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    // MARK: current location

                    // MARK: appears in
                    Text("Appears in:")
                        .font(.title3)

                    ForEach(dinosaur.movies, id: \.self) { movie in
                        /* HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 5))
                            Text(movie)
                        } */

                        Text("• \(movie)")
                            .font(.subheadline)
                    }

                    // MARK: movie moments
                    Text("Movie moments:")
                        .font(.title)
                        .padding(.top, 15)

                    ForEach(dinosaur.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)

                        Text(scene.sceneDescription)
                            .font(.subheadline)
                            .padding(.bottom, 15)
                    }

                    // MARK: link to webpage
                    Text("Read more:")
                        .font(.caption)

                    if let url = URL(string: dinosaur.link) {
                        /* Link(destination: url) {
                            Text(url.absoluteString)
                                .font(.subheadline)
                                    .foregroundColor(.blue)
                        } */
                        Link(dinosaur.link, destination: url)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .padding(.bottom)
                // .frame(width: geo.size.width, alignment: .leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .ignoresSafeArea()
        }
        .enableInjection()
    }
}

#Preview {
    DinosaurDetailView(dinosaur: DinosaurController().dinosaurs[7])
}
