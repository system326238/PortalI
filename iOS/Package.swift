// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "PortalInvasion",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "PortalInvasion",
            targets: ["PortalInvasion"]
        )
    ],
    targets: [
        .target(
            name: "PortalInvasion",
            dependencies: [],
            path: "."
        )
    ]
)
