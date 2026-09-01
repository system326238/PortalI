import SwiftUI

struct ShopView: View {
    @EnvironmentObject private var game: PortalInvasionGameModel

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("SHOP // ARMORY")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                Spacer()
                Text("CREDITS \(game.coins)")
                    .foregroundStyle(.yellow)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(ContentCatalog.shopTabs.indices, id: \ .self) { index in
                        Button(action: { game.shopTabIndex = index; game.shopIndex = 0 }) {
                            Text(ContentCatalog.shopTabs[index])
                                .font(.system(size: 12, weight: .bold, design: .monospaced))
                                .foregroundStyle(index == game.shopTabIndex ? .black : .white)
                                .frame(minWidth: 90)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(index == game.shopTabIndex ? Color.yellow : Color.white.opacity(0.08))
                                .cornerRadius(10)
                        }
                    }
                }
            }

            if game.shopTabIndex == 0 {
                weaponList
            } else if game.shopTabIndex == 2 {
                skinList
            } else {
                itemList
            }

            Button("BACK") { game.screen = .menu }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private var weaponList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(ContentCatalog.weapons.indices, id: \ .self) { index in
                    let weapon = ContentCatalog.weapons[index]
                    Button(action: { game.equipWeapon(index) }) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(weapon.name)
                                    .foregroundStyle(.white)
                                Text("DMG \(weapon.damage)  FIRE \(weapon.fireDelay) MS")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            Text(index == game.selectedWeaponIndex ? "OWNED" : "\(weapon.price) CR")
                                .foregroundStyle(weapon.color)
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                    }
                }
            }
        }
    }

    private var skinList: some View {
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
                                    .foregroundStyle(.white)
                                Text("LEVEL \(skin.unlockLevel)")
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
                        .cornerRadius(12)
                    }
                }
            }
        }
    }

    private var itemList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(game.currentShopCatalog.indices, id: \ .self) { index in
                    let item = game.currentShopCatalog[index]
                    Button(action: { game.shopIndex = index; game.buyItem() }) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.name)
                                    .foregroundStyle(.white)
                                Text(item.description)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("\(item.price) CR")
                                    .foregroundStyle(.yellow)
                                Text("LV \(item.unlockLevel)")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                    }
                }
            }
        }
    }
}
