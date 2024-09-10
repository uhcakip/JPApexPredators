//
//  DinosaurDetailView.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/2.
//

import Inject
import SwiftUI
import MapKit

struct DinosaurDetailView: View {
    @ObserveInjection var inject
    @StateObject private var viewModel: DinosaurDetailViewModel

    init(dinosaur: Dinosaur) {
        _viewModel = StateObject(wrappedValue: DinosaurDetailViewModel(dinosaur: dinosaur))
    }

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    BackgroundImage(type: viewModel.dinosaur.type)
                    DinosaurImage(imageName: viewModel.dinosaur.imageName, size: geo.size)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.dinosaur.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    DinosaurLocationMap(dinosaur: viewModel.dinosaur, position: viewModel.position)

                    MovieAppearances(movies: viewModel.dinosaur.movies)

                    MovieScenes(scenes: viewModel.dinosaur.movieScenes)

                    ExternalLink(url: viewModel.dinosaur.link)
                }
                .padding()
                .padding(.bottom)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .ignoresSafeArea()
        }
        .toolbarBackground(.automatic)
        .enableInjection()
    }
}

struct BackgroundImage: View {
    let type: DinosaurType

    var body: some View {
        Image(type.rawValue)
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
    }
}

struct DinosaurImage: View {
    let imageName: String
    let size: CGSize

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: size.width / 1.5, height: size.height / 3)
            .scaleEffect(x: -1)
            .offset(y: 20)
            .shadow(color: .black, radius: 7)
    }
}

struct DinosaurLocationMap: View {
    let dinosaur: Dinosaur
    let position: Binding<MapCameraPosition>

    var body: some View {
        NavigationLink {
            DinosaurMapView(location: dinosaur.location)
        } label: {
            Map(position: position) {
                Annotation(dinosaur.name, coordinate: dinosaur.location) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.largeTitle)
                        .imageScale(.large)
                        .symbolEffect(.pulse)
                }
                .annotationTitles(.hidden)
            }
            .frame(height: 125)
            .overlay(alignment: .trailing) {
                Image(systemName: "greaterthan")
                    .imageScale(.large)
                    .font(.title3)
                    .padding(.trailing, 5)
            }
            .overlay(alignment: .topLeading) {
                Text("Current location")
                    .padding(5)
                    .background(.black.opacity(0.5))
                    .clipShape(.rect(bottomTrailingRadius: 10))
            }
        }
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct MovieAppearances: View {
    let movies: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Appears in:")
                .font(.title3)
                .padding(.top, 15)

            ForEach(movies, id: \.self) { movie in
                Text("• \(movie)")
                    .font(.subheadline)
            }
        }
    }
}

struct MovieScenes: View {
    let scenes: [Dinosaur.MovieScene]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Movie moments:")
                .font(.title)
                .padding(.top, 15)

            ForEach(scenes) { scene in
                Text(scene.movie)
                    .font(.title2)
                    .padding(.vertical, 1)

                Text(scene.sceneDescription)
                    .font(.subheadline)
                    .padding(.bottom, 15)
            }
        }
    }
}

struct ExternalLink: View {
    let url: String

    var body: some View {
        if let url = URL(string: url) {
            VStack(alignment: .leading) {
                Text("Read more:")
                    .font(.caption)

                Link(url.absoluteString, destination: url)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    DinosaurDetailView(dinosaur: DinosaurService().fetchDinosaurs()[7])
}
