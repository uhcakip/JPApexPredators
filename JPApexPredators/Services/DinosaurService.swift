//
//  DinosaurService.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/8/25.
//

import Foundation

class DinosaurService {
    var dinosaurs: [Dinosaur] = []

    init() {
        decodeDinosaurs()
    }

    func decodeDinosaurs() {
        if let url = Bundle.main.url(forResource: "dinosaurs", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                dinosaurs = try decoder.decode([Dinosaur].self, from: data)
            } catch {
                print("Error decoding dinosaurs: \(error)")
            }
        }
    }
}
