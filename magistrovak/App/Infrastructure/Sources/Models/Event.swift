import Foundation

// MARK: - Event

public struct Event: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let startTime: String
    public let endTime: String
    public let date: String
}
