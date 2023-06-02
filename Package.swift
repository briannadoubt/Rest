// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Rest",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13),
    ],
    products: [
        .library(name: "Rest", targets: ["Rest"])
    ],
    targets: [
        .target(name: "Rest"),
        .testTarget(name: "RestTests", dependencies: ["Rest"]),
    ]
)
