// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FFExamine",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/apple/example-package-figlet", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "FFExamine",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Figlet", package: "example-package-figlet"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "FFExamineTests",
            dependencies: ["FFExamine"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
