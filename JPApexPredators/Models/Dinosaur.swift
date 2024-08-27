//
//  Dinosaur.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/8/23.
//

import Foundation
import SwiftUI

struct Dinosaur: Decodable, Identifiable {
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }

    enum DinosaurType: String, Decodable {
            case land
            case sea
            case air

            var background: Color {
                switch self {
                case .land:
                        .brown
                case .sea:
                        .teal
                case .air:
                        .blue
                }
            }
        }

    let id: Int
    let name: String
    let type: DinosaurType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String

    var imageName: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
}

