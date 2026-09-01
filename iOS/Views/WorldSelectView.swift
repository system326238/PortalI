import SwiftUI

struct WorldSelectView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("WORLD SELECT")
                .font(.title.bold())
                .foregroundStyle(.white)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 18) {
                    ForEach(ContentCatalog.worlds.indices, id: \ .self) { index in
                        let world = ContentCatalog.worlds[index]
                        Button(action: { game.beginWorld(index: index) }) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(world.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(world.subtitle)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .frame(maxWidth: .infinity, minHeight: 120, alignment: .leading)
                            .padding()
                            .background(LinearGradient(colors: [world.skyTop, world.skyBottom], startPoint: .top, endPoint: .bottom))
                            .cornerRadius(18)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(world.accent, lineWidth: index == game.worldIndex ? 2 : 0)
                            )
                        }
                    }
                }
            }
        }
        .padding()
    }
}
