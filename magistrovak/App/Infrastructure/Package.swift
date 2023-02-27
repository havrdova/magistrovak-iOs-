// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Infrastructure",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "APIClient",
            targets: ["APIClient"]
        ),
        .library(
            name: "CoreToolkit",
            targets: ["CoreToolkit"]
        ),
        .library(
            name: "Models",
            targets: ["Models"]
        ),
        .library(
            name: "UIToolkit",
            targets: ["UIToolkit"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "0.45.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.

        // MARK: - API Client Target

        .target(
            name: "APIClient",
            dependencies: [
                "CoreToolkit",
                "Models",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        ),
        .testTarget(
            name: "APIClientTests",
            dependencies: ["APIClient"]
        ),

        // MARK: - CoreToolKit Target

        .target(
            name: "CoreToolkit",
            dependencies: []
        ),

        // MARK: - Models Target

        .target(
            name: "Models",
            dependencies: []
        ),

        // MARK: - UIToolkit Target

        .target(
            name: "UIToolkit",
            dependencies: []
        )
    ]
)
