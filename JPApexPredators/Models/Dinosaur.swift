//
//  Dinosaur.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/8/23.
//

import Foundation
import MapKit
import SwiftUI

struct Dinosaur: Decodable, Identifiable {
    struct MovieScene: Decodable, Identifiable {
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

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
