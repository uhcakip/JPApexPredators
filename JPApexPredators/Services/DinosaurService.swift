//
//  DinosaurService.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/9.
//

import Foundation

protocol DinosaurServiceProtocol {
    func fetchDinosaurs() -> [Dinosaur]
}

class DinosaurService: DinosaurServiceProtocol {
    func fetchDinosaurs() -> [Dinosaur] {
        guard let url = Bundle.main.url(forResource: "dinosaurs", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Dinosaur].self, from: data)
        } catch {
            print("Error decoding dinosaurs: \(error)")
            return []
        }
    }
}
