//
//  DinosaurMapViewModel.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/10.
//

import MapKit
import SwiftUI

class DinosaurMapViewModel: ObservableObject {
    @Published var satelliteStyle = false
    let dinosaurs: [Dinosaur]
    let position: Binding<MapCameraPosition>

    init(dinosaurs: [Dinosaur] = DinosaurService().fetchDinosaurs(), location: CLLocationCoordinate2D) {
        self.dinosaurs = dinosaurs
        position = .constant(.camera(MapCamera(
            centerCoordinate: location,
            distance: 1000,
            heading: 250,
            pitch: 80
        )))
    }
}
