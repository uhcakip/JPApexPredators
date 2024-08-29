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

enum DinosaurType: String, Decodable, CaseIterable, Identifiable {
    case all // This case is for filter menu
    case land
    case sea
    case air

    var id: DinosaurType {
        self
    }

    var background: Color {
        switch self {
        case .all:
            .black
        case .land:
            .brown
        case .sea:
            .teal
        case .air:
            .blue
        }
    }

    var icon: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .sea:
            "drop.fill"
        case .air:
            "wind"
        }
    }
}
