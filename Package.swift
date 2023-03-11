// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Fizmo",
    products: [
        .library(
            name: "Fizmo",
            targets: ["Fizmo"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.8.0"),
        .package(url: "https://github.com/JohnSundell/Identity", from: "0.3.0"),
    ],
    targets: [
        .target(
            name: "Fizmo",
            dependencies: ["Identity"]
        ),
        .testTarget(
            name: "FizmoTests",
            dependencies: [
                "Fizmo",
                .product(name: "CustomDump", package: "swift-custom-dump"),
            ]
        ),
    ]
)
