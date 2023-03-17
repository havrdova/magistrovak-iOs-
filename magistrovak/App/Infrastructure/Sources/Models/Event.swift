import Foundation

// MARK: - Event

public struct Event: Equatable, Identifiable, Codable {
    public let id: String
    public let name: String
    public let startTime: String
    public let endTime: String
    public let date: String

    public init(id: String, name: String, startTime: String, endTime: String, date: String) {
        self.id = id
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.date = date
    }
}
