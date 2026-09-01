import SwiftUI

@main
struct PortalInvasionApp: App {
    @StateObject private var game = PortalInvasionGameModel()

    var body: some Scene {
        WindowGroup {
            GameRootView()
                .environmentObject(game)
        }
    }
}
