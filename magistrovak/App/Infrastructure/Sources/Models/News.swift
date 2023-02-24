import Foundation

// MARK: - News Model

public struct News: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let time: String
}
