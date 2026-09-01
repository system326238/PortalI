// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PortalInvasionApp",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .executable(
            name: "PortalInvasionApp",
            targets: ["PortalInvasionApp"]
        )
    ],
    targets: [
        .executableTarget(
            name: "PortalInvasionApp",
            path: "."
        )
    ]
)
