// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "AsyncMemoizer",
    platforms: [
        .macOS(.v11),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AsyncMemoizer",
            targets: ["AsyncMemoizer"]),
    ],
    targets: [
        .target(
            name: "AsyncMemoizer"),
        .testTarget(
            name: "AsyncMemoizerTests",
            dependencies: ["AsyncMemoizer"]),
    ]
)
