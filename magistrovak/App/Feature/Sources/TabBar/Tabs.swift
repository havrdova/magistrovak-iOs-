import Foundation

// MARK: - Tabs in TabView

public enum Tabs: String {
    case program
    case news
    case map

    func name() -> String {
        switch self {
        case .program:
            return "Program"    // TODO: add to strings
        case .news:
            return "Novinky"
        case .map:
            return "Mapa"
        }
    }

    func iconName() -> String {
        switch self {
        case .program:
            return "calendar"
        case .news:
            return "newspaper"
        case .map:
            return "map"
        }
    }
}
