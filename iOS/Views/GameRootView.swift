import SwiftUI

struct GameRootView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()

            switch game.screen {
            case .menu:
                MenuView()
            case .worldSelect:
                WorldSelectView()
            case .dressingRoom:
                DressingRoomView()
            case .shop:
                ShopView()
            case .profile:
                ProfileView()
            case .friends:
                FriendsView()
            case .settings:
                SettingsView()
            case .playing:
                GamePlayView()
            case .paused:
                PauseView()
            case .gameOver:
                GameOverView()
            }
        }
        .preferredColorScheme(.dark)
    }

    private var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [Color(hex: "040914"), Color(hex: "120E24"), Color(hex: "0D1F2D")],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

struct DressingRoomView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("DRESSING ROOM")
                .font(.title2.bold())
                .foregroundStyle(.white)
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(ContentCatalog.skins.indices, id: \ .self) { index in
                        let skin = ContentCatalog.skins[index]
                        Button(action: { game.equipSkin(index) }) {
                            HStack {
                                Rectangle()
                                    .fill(LinearGradient(colors: [skin.primary, skin.secondary], startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(12)
                                VStack(alignment: .leading) {
                                    Text(skin.name)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text("UNLOCK LEVEL \(skin.unlockLevel)")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                                if index == game.selectedSkinIndex {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.green)
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(16)
                        }
                    }
                }
            }
            Button("BACK") { game.screen = .menu }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct FriendsView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("FRIENDS // LOCAL NETWORK")
                .font(.title2.bold())
                .foregroundStyle(.white)
            ForEach(game.friends.indices, id: \ .self) { index in
                Text(game.friends[index])
                    .foregroundStyle(index == 0 ? .cyan : .white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(10)
            }
            Button("BACK") { game.screen = .menu }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct SettingsView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("SETTINGS")
                .font(.title2.bold())
                .foregroundStyle(.white)
            VStack(alignment: .leading, spacing: 12) {
                Toggle("AUDIO SIGNAL", isOn: $game.sound)
                    .tint(.cyan)
                Text("VOLUME")
                    .foregroundStyle(.white)
                Slider(value: Binding(get: { Double(game.volume) }, set: { game.volume = Int($0) }), in: 0...100)
                    .tint(.cyan)
            }
            Button("BACK") { game.screen = .menu }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct PauseView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(spacing: 20) {
            Text("RUN PAUSED")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
            HStack(spacing: 16) {
                Button("RESUME") { game.screen = .playing }
                    .buttonStyle(.borderedProminent)
                Button("ABORT") { game.screen = .menu }
                    .buttonStyle(.bordered)
            }
        }
    }
}

struct GameOverView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(spacing: 18) {
            Text("SIGNAL LOST")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
            Text("SCORE  \(game.score)")
                .foregroundStyle(.yellow)
            Text("XP EARNED  \(game.profileXp)")
                .foregroundStyle(.cyan)
            Button("RETURN TO COMMAND") { game.screen = .menu }
                .buttonStyle(.borderedProminent)
        }
    }
}
