//
//  DinosaurDetailViewModel.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/10.
//

import Foundation

final class DinosaurDetailViewModel: ObservableObject {
    let dinosaur: Dinosaur

    init(dinosaur: Dinosaur) {
        self.dinosaur = dinosaur
    }
}
