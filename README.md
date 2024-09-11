# JPApexPredators

## Overview
This SwiftUI project is a Jurassic Park themed application that showcases various dinosaurs from the Jurassic Park and Jurassic World movie franchises. It allows users to browse, search, and learn about different dinosaurs, their characteristics, and their appearances in the movies.

The project demonstrates the use of SwiftUI, MVVM architecture, and various iOS technologies to create an engaging and interactive user experience.

The project is based on the Udemy course [iOS 18, SwiftUI 6, & Swift 6: Build iOS Apps From Scratch](https://www.udemy.com/course/ios-15-app-development-with-swiftui-3-and-swift-5/), **with significant refactoring and enhancements implemented by myself.**

## Features
- Browse a list of dinosaurs from the Jurassic Park universe
- Filter dinosaurs by type (land, sea, air)
- Search for specific dinosaurs
- View detailed information about each dinosaur
- Interactive map showing dinosaur locations
- Sticker pack extension for iMessage

## Demo
For a video demonstration of the app in action, check out this short clip:

![demo-simulator-screen-recording.gif](demo-simulator-screen-recording.gif)

## Project Structure
- `Views/`: Main views for the dinosaur list, detail, and map interfaces
- `ViewModels/`: View models implementing the application logic
- `Models/`: Data models for dinosaurs and related types
- `Services/`: Services for fetching dinosaur data
- `Resources/`: JSON data file containing dinosaur information

```
JPApexPredators/
├── JPApexPredatorsApp.swift
├── Views/
│   ├── DinosaurListView.swift
│   ├── DinosaurDetailView.swift
│   └── DinosaurMapView.swift
├── ViewModels/
│   ├── DinosaurListViewModel.swift
│   ├── DinosaurDetailViewModel.swift
│   └── DinosaurMapViewModel.swift
├── Models/
│   ├── Dinosaur.swift
│   └── DinosaurType.swift
├── Services/
│   └── DinosaurService.swift
└── Resources/
    └── dinosaurs.json
```

## Enhancements and Refactoring
- Implemented MVVM architecture for improved separation of concerns
- Created reusable UI components for better maintainability
- Utilized SwiftUI's latest features like `@StateObject` and `@ObservedObject`

## Requirements
- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## Dependencies
- [Inject](https://github.com/krzysztofzablocki/Inject) - Used for hot reloading during development
- [SwiftLint](https://github.com/realm/SwiftLint) - Used for code linting
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) - Used for code formatting