//
//  DinosaurController.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/8/25.
//

import Foundation

class DinosaurController {
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

    func filterAndSort(by type: DinosaurType, text searchText: String, sort alphabetically: Bool) -> [Dinosaur] {
        var filteredDinosaurs = dinosaurs

        if type != .all {
            filteredDinosaurs = filteredDinosaurs.filter { $0.type == type }
        }
        if !searchText.isEmpty {
            filteredDinosaurs = filteredDinosaurs.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }

        filteredDinosaurs.sort { alphabetically ? $0.name < $1.name : $0.id < $1.id }
        return filteredDinosaurs
    }
}
