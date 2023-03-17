import Foundation

// MARK: - News Model

public struct News: Equatable, Identifiable, Codable {
    public let id: String
    public let name: String
    public let time: String

    public init(id: String, name: String, time: String) {
        self.id = id
        self.name = name
        self.time = time
    }
}
