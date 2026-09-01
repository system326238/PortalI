import SwiftUI

@MainActor
final class PortalInvasionGameModel: ObservableObject {
    enum Screen {
        case menu
        case worldSelect
        case dressingRoom
        case shop
        case profile
        case friends
        case settings
        case playing
        case paused
        case gameOver
    }

    @Published var screen: Screen = .menu
    @Published var menuIndex = 0
    @Published var worldIndex = 0
    @Published var shopTabIndex = 0
    @Published var shopIndex = 0
    @Published var selectedSkinIndex = 0
    @Published var selectedWeaponIndex = 0
    @Published var profileName = "Pilot"
    @Published var profileXp = 0
    @Published var score = 0
    @Published var coins = 1200
    @Published var lives = 3
    @Published var sound = true
    @Published var volume = 80
    @Published var xpBoost = false
    @Published var bossMode = false
    @Published var friends: [String] = ["Nyx", "Vex", "Rin"]
    @Published var languageIndex = 0
    @Published var settingsTab = 0

    let menuOptions = [
        "START RUN",
        "BOSS CHALLENGE MODE",
        "DRESSING ROOM",
        "SHOP // ARMORY",
        "PILOT PROFILE",
        "FRIENDS",
        "SETTINGS",
        "LOGIN"
    ]

    let menuScreenOrder = [0, 1, 2, 3, 4, 5, 6, 7]

    var currentLevel: Int {
        max(1, 1 + profileXp / 500)
    }

    var xpToNextLevel: Int {
        max(1, currentLevel * 500 - profileXp)
    }

    func activateMenu(index: Int) {
        menuIndex = index
        switch index {
        case 0: screen = .worldSelect
        case 1: screen = .worldSelect; bossMode = true
        case 2: screen = .dressingRoom
        case 3: screen = .shop
        case 4: screen = .profile
        case 5: screen = .friends
        case 6: screen = .settings
        default: break
        }
    }

    func beginWorld(index: Int) {
        worldIndex = max(0, min(ContentCatalog.worlds.count - 1, index))
        screen = .playing
    }

    func buyItem() {
        let items = currentShopCatalog
        guard shopIndex >= 0, shopIndex < items.count else { return }
        let item = items[shopIndex]
        guard currentLevel >= item.unlockLevel else { return }
        guard coins >= item.price else { return }

        coins -= item.price
        if item.name.contains("REPAIR") || item.name.contains("LIFE BOOST") {
            lives += 1
        }
        if item.name.contains("XP BOOST") {
            xpBoost = true
        }
        if item.name.contains("BOSS PASS") || item.name.contains("GATE TICKET") || item.name.contains("RISK PASS") || item.name.contains("LEGION PASS") {
            bossMode = true
        }
    }

    func equipWeapon(_ index: Int) {
        guard index >= 0, index < ContentCatalog.weapons.count else { return }
        selectedWeaponIndex = index
    }

    func equipSkin(_ index: Int) {
        guard index >= 0, index < ContentCatalog.skins.count else { return }
        selectedSkinIndex = index
    }

    var currentShopCatalog: [ShopItem] {
        switch shopTabIndex {
        case 1: return ContentCatalog.items
        case 3: return ContentCatalog.upgrades
        case 4: return ContentCatalog.boosts
        case 5: return ContentCatalog.relics
        case 6: return ContentCatalog.passes
        case 7: return ContentCatalog.companions
        case 8: return ContentCatalog.featured
        default: return []
        }
    }

    var currentTabName: String {
        if shopTabIndex >= 0 && shopTabIndex < ContentCatalog.shopTabs.count {
            return ContentCatalog.shopTabs[shopTabIndex]
        }
        return "FEATURED"
    }

    func cycleShopTab(direction: Int) {
        let maxIndex = ContentCatalog.shopTabs.count - 1
        shopTabIndex = max(0, min(maxIndex, shopTabIndex + direction))
        if shopIndex >= currentShopCatalog.count {
            shopIndex = max(0, currentShopCatalog.count - 1)
        }
    }
}
