<div align="center">

# JPApexPredators

[![Swift 5.10](https://img.shields.io/badge/Swift-5.10-orange?logo=swift)](https://developer.apple.com/swift/)
[![Xcode 15.4](https://img.shields.io/badge/Xcode-15.4-007ACC?logo=Xcode&logoColor=blue)](https://developer.apple.com/xcode/)
[![iOS 17](https://img.shields.io/badge/iOS-17-363737?logo=apple&logoColor=white)](https://developer.apple.com/ios/)

  <div>
    <img src="_Demo/1-mockup-main-screen.png" width="30%" alt="Main Screen">&nbsp;&nbsp;&nbsp;
    <img src="_Demo/2-mockup-main-screen-filter.png" width="30%" alt="Main Screen with Filter">&nbsp;&nbsp;&nbsp;
    <img src="_Demo/3-mockup-detail-screen.png" width="30%" alt="Detail Screen">
    <br><br>
    <img src="_Demo/4-mockup-map-screen-standard.png" width="30%" alt="Map Screen (Standard)">&nbsp;&nbsp;&nbsp;
    <img src="_Demo/5-mockup-map-screen-imagery.png" width="30%" alt="Map Screen (Imagery)">&nbsp;&nbsp;&nbsp;
    <img src="_Demo/6-mockup-stickers.png" width="30%" alt="Stickers">
  </div>

</div>

## Overview
This SwiftUI project is a Jurassic Park themed application that showcases various dinosaurs from the Jurassic Park and Jurassic World movie franchises. Here are the features:

- Browse a list of dinosaurs from the Jurassic Park universe
- Filter dinosaurs by type (land, sea, air)
- Search for specific dinosaurs
- View detailed information about each dinosaur
- Interactive map showing dinosaur locations
- Sticker pack extension for iMessage

Based on the Udemy course [iOS 18, SwiftUI 6, & Swift 6: Build iOS Apps From Scratch](https://www.udemy.com/course/ios-15-app-development-with-swiftui-3-and-swift-5/), **with the following implementations by myself**:

- Integration of additional packages (as shown in [Packages](#packages)) to extend capabilities and streamline development
- Project structure layout (as shown in [Project Structure](#project-structure)) for better organization
- Improved code quality and functionality (as shown in [Enhancements and Refactoring](#enhancements-and-refactoring))

## Demo
<img src="_Demo/demo.gif" alt="JPApexPredators Demo">

## Packages
This project uses Swift Package Manager (SPM) for dependency management. The following packages are included:

- [Inject](https://github.com/krzysztofzablocki/Inject) - Used for hot reloading during development
- [SwiftLint](https://github.com/realm/SwiftLint) - Used for code linting
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) - Used for code formatting

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
