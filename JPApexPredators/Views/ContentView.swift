//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Yuna Chou on 2024/8/22.
//

import Inject
import SwiftUI

struct ContentView: View {
    @ObserveInjection var inject
    @StateObject private var viewModel: DinosaurListViewModel

    init(viewModel: DinosaurListViewModel = DinosaurListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            List(viewModel.filteredDinosaurs) { dinosaur in
                NavigationLink {
                    DinosaurDetailView(dinosaur: dinosaur)
                } label: {
                    DinosaurRow(dinosaur: dinosaur)
                }
            }
            .navigationTitle("Dinosaurs")
            .searchable(text: $viewModel.searchText)
            .disableAutocorrection(true)
            .animation(.default, value: viewModel.searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    SortButton(sortByName: $viewModel.sortByName)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    FilterMenu(selectedType: $viewModel.selectedType)
                }
            }
        }
        .preferredColorScheme(.dark)
        .enableInjection()
    }
}

struct DinosaurRow: View {
    let dinosaur: Dinosaur

    var body: some View {
        HStack {
            Image(dinosaur.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1)

            VStack(alignment: .leading) {
                Text(dinosaur.name)
                    .fontWeight(.bold)

                Text(dinosaur.type.rawValue.capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .background(dinosaur.type.background)
                    .clipShape(.capsule)
            }
        }
    }
}

struct SortButton: View {
    @Binding var sortByName: Bool

    var body: some View {
        Button {
            withAnimation {
                sortByName.toggle()
            }
        } label: {
            Image(systemName: sortByName ? "film" : "textformat")
                .symbolEffect(.bounce, value: sortByName)
        }
    }
}

struct FilterMenu: View {
    @Binding var selectedType: DinosaurType

    var body: some View {
        Menu {
            Picker("Filter", selection: $selectedType.animation()) {
                ForEach(DinosaurType.allCases) { type in
                    Label(type.rawValue.capitalized, systemImage: type.icon)
                }
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.accent.opacity(selectedType == .all ? 0 : 0.3))
                    .frame(width: 30, height: 30)
                    .animation(nil, value: selectedType) // disable animation triggered by Picker

                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.accent)
                    .symbolEffect(.bounce, value: selectedType)
            }
        }
    }
}

#Preview {
    ContentView()
}
