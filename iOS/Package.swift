// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PortalInvasionApp",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        // EXPORTED OUTPUT: Exposes your code as an executable app or library
        .executable(
            name: "PortalInvasionApp",
            targets: ["PortalInvasionApp"]
        )
    ],
    dependencies: [
        // Add third-party Swift package dependencies here
    ],
    targets: [
        // INTERNAL MODULE: Compiles your Swift source code files
        .executableTarget(
            name: "PortalInvasionApp",
            dependencies: [],
            path: "." // Tells SPM to read source files in the current folder (Views, Game, etc.)
        )
    ]
)
