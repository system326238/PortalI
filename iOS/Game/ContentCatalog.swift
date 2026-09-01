import SwiftUI

struct World: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let accent: Color
    let skyTop: Color
    let skyBottom: Color
    let hazardRate: Int
    let enemyRate: Int
}

struct Weapon: Identifiable {
    let id = UUID()
    let name: String
    let damage: Int
    let fireDelay: Int
    let price: Int
    let color: Color
}

struct Skin: Identifiable {
    let id = UUID()
    let name: String
    let primary: Color
    let secondary: Color
    let unlockLevel: Int
}

struct ShopItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Int
    let unlockLevel: Int
}

struct ContentCatalog {
    static let shopTabs = [
        "WEAPONS",
        "ITEMS",
        "SKINS",
        "UPGRADES",
        "BOOSTS",
        "RELICS",
        "PASSES",
        "COMPANIONS",
        "FEATURED"
    
    ]
    static let worlds: [World] = [
        World(name: "NEON ORBIT", subtitle: "city lights above the cloudline", accent: .cyan, skyTop: .black, skyBottom: .init(hex: "0D1C38"), hazardRate: 28, enemyRate: 26),
        World(name: "RUST MOON", subtitle: "industrial dust and broken satellites", accent: .orange, skyTop: .init(hex: "1E0F13"), skyBottom: .init(hex: "2A1A2C"), hazardRate: 24, enemyRate: 31),
        World(name: "ICE DIVIDE", subtitle: "a frozen fault in the outer dark", accent: .blue, skyTop: .init(hex: "071B2A"), skyBottom: .init(hex: "102C44"), hazardRate: 20, enemyRate: 36),
        World(name: "THE RIFT", subtitle: "reality is losing its edges", accent: .purple, skyTop: .init(hex: "100D2A"), skyBottom: .init(hex: "29142C"), hazardRate: 18, enemyRate: 42),
        World(name: "SOLAR FRONTIER", subtitle: "flare storms over a mining colony", accent: .orange, skyTop: .init(hex: "2C180F"), skyBottom: .init(hex: "3A1D16"), hazardRate: 32, enemyRate: 35),
        World(name: "GHOST STATION", subtitle: "an abandoned relay still transmitting", accent: .indigo, skyTop: .init(hex: "080D1C"), skyBottom: .init(hex: "182032"), hazardRate: 26, enemyRate: 29),
        World(name: "VERDANT ARC", subtitle: "alien gardens orbit a silent moon", accent: .green, skyTop: .init(hex: "0A1E1B"), skyBottom: .init(hex: "163626"), hazardRate: 23, enemyRate: 32),
        World(name: "CHROME TRENCH", subtitle: "a war factory beneath the rings", accent: .gray, skyTop: .init(hex: "1B1F2B"), skyBottom: .init(hex: "1F2D3A"), hazardRate: 34, enemyRate: 40),
        World(name: "EMBER VEIL", subtitle: "red dust hides a portal breach", accent: .red, skyTop: .init(hex: "210B12"), skyBottom: .init(hex: "410C1E"), hazardRate: 29, enemyRate: 44),
        World(name: "ORBITAL DEEP", subtitle: "the last beacon beyond mapped space", accent: .blue, skyTop: .init(hex: "0A1227"), skyBottom: .init(hex: "0F1F34"), hazardRate: 21, enemyRate: 46),
        World(name: "MIRROR SEA", subtitle: "fractured light with nowhere to land", accent: .mint, skyTop: .init(hex: "0A1C20"), skyBottom: .init(hex: "0B2E39"), hazardRate: 19, enemyRate: 39),
        World(name: "VOID CITADEL", subtitle: "the enemy built a world-sized fortress", accent: .pink, skyTop: .init(hex: "120716"), skyBottom: .init(hex: "2B112C"), hazardRate: 38, enemyRate: 52),
        World(name: "ECLIPSE RUN", subtitle: "two suns, one narrow escape route", accent: .yellow, skyTop: .init(hex: "1A170F"), skyBottom: .init(hex: "322218"), hazardRate: 36, enemyRate: 49),
        World(name: "NOVA GRAVE", subtitle: "dead ships drift through blue fire", accent: .cyan, skyTop: .init(hex: "0A1928"), skyBottom: .init(hex: "122C42"), hazardRate: 33, enemyRate: 54)
    ]

    static let weapons: [Weapon] = [
        Weapon(name: "CLASSIC BLASTER", damage: 1, fireDelay: 220, price: 0, color: .yellow),
        Weapon(name: "NOVA SPREAD", damage: 1, fireDelay: 320, price: 350, color: .pink),
        Weapon(name: "ICE LANCE", damage: 2, fireDelay: 380, price: 700, color: .cyan),
        Weapon(name: "RIFT CANNON", damage: 3, fireDelay: 460, price: 1200, color: .purple)
    ]

    static let skins: [Skin] = [
        Skin(name: "SOLARIS", primary: .yellow, secondary: .orange, unlockLevel: 0),
        Skin(name: "COSMIC", primary: .purple, secondary: .cyan, unlockLevel: 2),
        Skin(name: "ICEWALKER", primary: .cyan, secondary: .blue, unlockLevel: 4),
        Skin(name: "RIFTBORN", primary: .pink, secondary: .purple, unlockLevel: 7),
        Skin(name: "NIGHT SIGNAL", primary: .mint, secondary: .teal, unlockLevel: 10),
        Skin(name: "BLACKSTAR", primary: .white, secondary: .indigo, unlockLevel: 14)
    ]

    static let items: [ShopItem] = [
        ShopItem(name: "REPAIR KIT", description: "Restore one life after a lost run", price: 250, unlockLevel: 1),
        ShopItem(name: "MED-BAY PACK", description: "Restore damaged hull and stabilize the ship", price: 380, unlockLevel: 2),
        ShopItem(name: "TURRET CHIP", description: "Deploy a small turret that fires on its own", price: 520, unlockLevel: 3),
        ShopItem(name: "SCRAP BUNDLE", description: "Convert salvage into bigger credits", price: 700, unlockLevel: 4),
        ShopItem(name: "PHASE SHIELD", description: "Reduce incoming damage for one run", price: 950, unlockLevel: 6),
        ShopItem(name: "PHOTON CAGE", description: "Trap elite enemies and buy a safer route", price: 1250, unlockLevel: 8)
    ]

    static let upgrades: [ShopItem] = [
        ShopItem(name: "REACTOR CORE", description: "Boost engine efficiency and control", price: 430, unlockLevel: 2),
        ShopItem(name: "HULL PLATING", description: "Increase survivability in long runs", price: 600, unlockLevel: 3),
        ShopItem(name: "TARGET AI", description: "Improve accuracy and tracking", price: 760, unlockLevel: 4),
        ShopItem(name: "OVERDRIVE MATRIX", description: "Raise shot power and burst output", price: 980, unlockLevel: 6),
        ShopItem(name: "QUANTUM RAIL", description: "Adds a stronger final upgrade tier", price: 1400, unlockLevel: 8)
    ]

    static let boosts: [ShopItem] = [
        ShopItem(name: "XP BOOST", description: "Add a permanent 10% run XP bonus", price: 500, unlockLevel: 3),
        ShopItem(name: "CREDIT BOOST", description: "Highest payout from each mission", price: 680, unlockLevel: 4),
        ShopItem(name: "LIFE BOOST", description: "Gain one extra ship revival", price: 820, unlockLevel: 5),
        ShopItem(name: "RUSH MOD", description: "Move faster through hazard zones", price: 1100, unlockLevel: 7),
        ShopItem(name: "MIRROR FIELD", description: "Double critical-hit windows", price: 1480, unlockLevel: 9)
    ]

    static let relics: [ShopItem] = [
        ShopItem(name: "AETHER KEY", description: "Unlock arcane transit routes", price: 560, unlockLevel: 3),
        ShopItem(name: "VOID GEM", description: "Stabilize portal anomalies", price: 720, unlockLevel: 4),
        ShopItem(name: "JUPITER CORE", description: "Improve boss-rush performance", price: 930, unlockLevel: 6),
        ShopItem(name: "ASTRA RUNE", description: "Enhance rare loot drops", price: 1180, unlockLevel: 7),
        ShopItem(name: "AETHER KILLER", description: "Unlock arcane transit routes", price: 560, unlockLevel: 3),
        ShopItem(name: "RAVE SHOOT", description: "Stabilize portal anomalies", price: 720, unlockLevel: 4),
        ShopItem(name: "COSMIC VOID", description: "Improve boss-rush performance", price: 930, unlockLevel: 6),
        ShopItem(name: "AZTEK CORE", description: "Enhance rare loot drops", price: 1180, unlockLevel: 7),
        ShopItem(name: "OMEN RELIC", description: "Unlock final challenge bonuses", price: 1550, unlockLevel: 9)
    ]

    static let passes: [ShopItem] = [
        ShopItem(name: "BOSS PASS", description: "Unlock the next boss route", price: 900, unlockLevel: 5),
        ShopItem(name: "GATE TICKET", description: "Access hidden world sectors", price: 1050, unlockLevel: 6),
        ShopItem(name: "RISK PASS", description: "Shift challenge difficulty upward", price: 1220, unlockLevel: 7),
        ShopItem(name: "LEGION PASS", description: "Refined progression for elite pilots", price: 1450, unlockLevel: 9)
    ]

    static let companions: [ShopItem] = [
        ShopItem(name: "DRONE WING", description: "Follow and defend the ship", price: 440, unlockLevel: 2),
        ShopItem(name: "SCOUT BEE", description: "Reveal extra pickups and routes", price: 620, unlockLevel: 3),
        ShopItem(name: "AUX TURRET", description: "Auto-aim support during waves", price: 840, unlockLevel: 4),
        ShopItem(name: "NOVA MANTIS", description: "Aerial support with burst strikes", price: 1110, unlockLevel: 7),
        ShopItem(name: "ORBITAL SPORE", description: "Adds a shield companion for bosses", price: 1500, unlockLevel: 9)
    ]

    static let featured: [ShopItem] = [
        ShopItem(name: "REPAIR KIT", description: "Restore one life after a lost run", price: 250, unlockLevel: 1),
        ShopItem(name: "XP BOOST", description: "Add a permanent 10% run XP bonus", price: 500, unlockLevel: 3),
        ShopItem(name: "REACTOR CORE", description: "Boost engine efficiency and control", price: 430, unlockLevel: 2),
        ShopItem(name: "BOSS PASS", description: "Unlock the next boss route", price: 900, unlockLevel: 5),
        ShopItem(name: "AUX TURRET", description: "Auto-aim support during waves", price: 840, unlockLevel: 4),
        ShopItem(name: "OMEN RELIC", description: "Unlock final challenge bonuses", price: 1550, unlockLevel: 9)
    ]

    static func catalog(for tabIndex: Int) -> [ShopItem] {
        switch tabIndex {
        case 0: return []
        case 1: return items
        case 2: return []
        case 3: return upgrades
        case 4: return boosts
        case 5: return relics
        case 6: return passes
        case 7: return companions
        case 8: return featured
        default: return []
        }
    }
}

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let value = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized
        var rgb: UInt64 = 0
        Scanner(string: value).scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
