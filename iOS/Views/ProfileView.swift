import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("PILOT PROFILE")
                .font(.title2.bold())
                .foregroundStyle(.white)

            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(game.profileName)
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                    Text("LEVEL \(game.currentLevel)")
                        .foregroundStyle(.yellow)
                    Text("XP \(game.profileXp) / NEXT LEVEL IN \(game.xpToNextLevel)")
                        .foregroundStyle(.gray)
                }
                Spacer()
                Circle()
                    .fill(LinearGradient(colors: [.cyan, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 84, height: 84)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("LIVES  \(game.lives)     CREDITS  \(game.coins)")
                    .foregroundStyle(.white)
                Text("LOADOUT  \(ContentCatalog.weapons[game.selectedWeaponIndex].name)")
                    .foregroundStyle(.white)
                Text("SKIN  \(ContentCatalog.skins[game.selectedSkinIndex].name)")
                    .foregroundStyle(.white)
                Text("HIGH SCORE  \(game.score)")
                    .foregroundStyle(.cyan)
            }

            Button("BACK") {
                game.screen = .menu
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
