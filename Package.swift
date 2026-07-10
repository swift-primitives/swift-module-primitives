// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-module-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Module Primitives",
            targets: ["Module Primitives"]
        ),
        .library(
            name: "Module Primitives Test Support",
            targets: ["Module Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-source-primitives.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Module Primitives",
            dependencies: [
                .product(name: "Source Primitives", package: "swift-source-primitives")
            ]
        ),
        .target(
            name: "Module Primitives Test Support",
            dependencies: [
                "Module Primitives",
                .product(name: "Source Primitives Test Support", package: "swift-source-primitives"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Module Primitives Tests",
            dependencies: [
                "Module Primitives",
                "Module Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
