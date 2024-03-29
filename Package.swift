// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "toast",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Toast",
            targets: ["Toast"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Toast",
            resources: [
                .copy("Resources/Images/ToastAssets.xcassets")
            ]
        ),
        .testTarget(
            name: "ToastTests",
            dependencies: ["Toast"]),
    ]
)
