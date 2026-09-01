import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("PORTAL//INVASION")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
                .foregroundStyle(.cyan)
            Text("COMMAND MENU")
                .font(.system(size: 34, weight: .heavy, design: .monospaced))
                .foregroundStyle(.white)

            VStack(alignment: .leading, spacing: 10) {
                ForEach(Array(game.menuOptions.enumerated()), id: \ .offset) { index, label in
                    Button(action: {
                        if index == 7 { game.screen = .menu }
                        else { game.activateMenu(index: index) }
                    }) {
                        HStack {
                            Text(label)
                                .font(.system(size: 18, weight: index == game.menuIndex ? .bold : .regular, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(index == game.menuIndex ? .yellow : .white)
                            if index == game.menuIndex {
                                Image(systemName: "arrowtriangle.right.fill")
                                    .foregroundStyle(.yellow)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .frame(maxWidth: 420)
            Spacer()
        }
        .padding(28)
    }
}
