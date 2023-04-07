// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CocoaUI",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "CocoaUI",
            targets: ["CocoaUI"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CocoaUI",
            dependencies: []
        ),
        .testTarget(
            name: "CocoaUITests",
            dependencies: ["CocoaUI"]
        ),
    ]
)
