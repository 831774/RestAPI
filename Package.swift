// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RestKit",
    products: [
        .library(
            name: "RestKit",
            targets: ["RestKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "RestKit",
            dependencies: []),
        .testTarget(
            name: "RestKitTests",
            dependencies: ["RestKit"]),
    ]
)
