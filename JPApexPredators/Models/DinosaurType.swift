//
//  DinosaurType.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/9.
//

import SwiftUI

enum DinosaurType: String, Decodable, CaseIterable, Identifiable {
    case all // This case is for filter menu
    case land
    case sea
    case air

    var id: Self {
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
