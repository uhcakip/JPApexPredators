//
//  DinosaurListViewModel.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/9/9.
//

import Foundation

class DinosaurListViewModel: ObservableObject {
    @Published var dinosaurs: [Dinosaur] = []
    @Published var selectedType: DinosaurType = .all
    @Published var searchText = ""
    @Published var sortByName = false

    private let service: DinosaurServiceProtocol

    init(service: DinosaurServiceProtocol = DinosaurService()) {
        self.service = service
        self.dinosaurs = service.fetchDinosaurs()
    }

    var filteredDinosaurs: [Dinosaur] {
        filterAndSort(by: selectedType, text: searchText, sortByName: sortByName)
    }

    func filterAndSort(by type: DinosaurType, text: String, sortByName: Bool) -> [Dinosaur] {
        var filtered = dinosaurs

        if type != .all {
            filtered = filtered.filter { $0.type == type }
        }

        if !text.isEmpty {
            filtered = filtered.filter { $0.name.lowercased().contains(text.lowercased()) }
        }

        if sortByName {
            filtered.sort { $0.name < $1.name }
        }

        return filtered
    }
}
