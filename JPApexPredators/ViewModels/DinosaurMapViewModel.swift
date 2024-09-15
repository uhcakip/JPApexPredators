//
//  DinosaurMapViewModel.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/10.
//

import Foundation

final class DinosaurMapViewModel: ObservableObject {
    @Published var satelliteStyle = false
    let dinosaurs: [Dinosaur]

    init(dinosaurs: [Dinosaur] = DinosaurService().fetchDinosaurs()) {
        self.dinosaurs = dinosaurs
    }
}
