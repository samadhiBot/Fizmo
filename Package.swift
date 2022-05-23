// swift-tools-version: 5.6

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
        .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.4.0"),
    ],
    targets: [
        .target(
            name: "Fizmo",
            dependencies: []
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
