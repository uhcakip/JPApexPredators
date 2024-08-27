//
//  Dinosaur.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/8/23.
//

import Foundation

struct Dinosaur: Decodable, Identifiable {
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }

    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
}

