// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "SwiftTemplates",
    products: [],
    dependencies: [
        .package(url: "https://github.com/krzysztofzablocki/Sourcery", .upToNextMinor(from: "1.8.2")),
    ],
    targets: [
        .target(name: "ModuleA"),
        .target(name: "ModuleB"),
        .testTarget(
            name: "SwiftTemplatesTests",
            dependencies: [
                "ModuleA",
                "ModuleB",
            ],
            resources: [
                .copy("Expected/"),
                .copy("Generated/"),
            ]
        )
    ]
)
