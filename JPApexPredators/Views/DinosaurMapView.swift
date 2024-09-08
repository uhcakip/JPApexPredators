//
//  DinosaurMapView.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/6.
//

import SwiftUI
import Inject
import MapKit

struct DinosaurMapView: View {
    @ObserveInjection var inject
    @State private var satelliteStyle = false
    private var position: Binding<MapCameraPosition>
    private let dinosaurController = DinosaurController()

    var location: CLLocationCoordinate2D

    init(location: CLLocationCoordinate2D) {
        self.location = location
        self.position = .constant(.camera(MapCamera(
            centerCoordinate: location,
            distance: 1000,
            heading: 250,
            pitch: 80
        )))
    }

    var body: some View {
        Map(position: position) {
            ForEach(dinosaurController.dinosaurs) { dinosaur in
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
        .mapStyle(satelliteStyle ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                satelliteStyle.toggle()
            } label: {
                Image(systemName: "globe.americas")
                    .symbolVariant(satelliteStyle ? .fill : .none)
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
    DinosaurMapView(location: DinosaurController().dinosaurs[2].location)
}
