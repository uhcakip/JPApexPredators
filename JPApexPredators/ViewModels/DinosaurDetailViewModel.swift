//
//  DinosaurDetailViewModel.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/10.
//

import MapKit
import SwiftUI

class DinosaurDetailViewModel: ObservableObject {
    let dinosaur: Dinosaur
    let position: Binding<MapCameraPosition>

    init(dinosaur: Dinosaur) {
        self.dinosaur = dinosaur
        position = .constant(.camera(MapCamera(
            centerCoordinate: dinosaur.location,
            distance: 3000
        )))
    }
}
