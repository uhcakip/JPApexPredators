//
//  DinosaurDetailViewModel.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/10.
//

import SwiftUI
import MapKit

class DinosaurDetailViewModel: ObservableObject {
    let dinosaur: Dinosaur
    let position: Binding<MapCameraPosition>

    init(dinosaur: Dinosaur) {
        self.dinosaur = dinosaur
        self.position = .constant(.camera(MapCamera(
            centerCoordinate: dinosaur.location,
            distance: 3000
        )))
    }
}
