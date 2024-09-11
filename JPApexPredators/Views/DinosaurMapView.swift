//
//  DinosaurMapView.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/6.
//

import Inject
import MapKit
import SwiftUI

struct DinosaurMapView: View {
    @ObserveInjection var inject
    @StateObject private var viewModel: DinosaurMapViewModel

    init(location: CLLocationCoordinate2D) {
        _viewModel = StateObject(wrappedValue: DinosaurMapViewModel(location: location))
    }

    var body: some View {
        Map(position: viewModel.position) {
            ForEach(viewModel.dinosaurs) { dinosaur in
                Annotation(dinosaur.name, coordinate: dinosaur.location) {
                    Image(dinosaur.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
            }
        }
        .mapStyle(viewModel.satelliteStyle ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                viewModel.satelliteStyle.toggle()
            } label: {
                Image(systemName: "globe.americas")
                    .symbolVariant(viewModel.satelliteStyle ? .fill : .none)
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.thinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
        .enableInjection()
    }
}

#Preview {
    DinosaurMapView(location: DinosaurService().fetchDinosaurs()[2].location)
}
