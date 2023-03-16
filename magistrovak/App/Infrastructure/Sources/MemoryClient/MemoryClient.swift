import ComposableArchitecture
import Foundation
import Models

// MARK: - Memory Client

public struct MemoryClient {
    /// returns list of events and list od dates
    public var getProgramList: () -> ([Event], [String])
    public var getNewsList: () -> [News]
}

// MARK: - Dependency Key

public enum MemoryClientKey: DependencyKey {
    public static let liveValue = MemoryClient.liveValue
    // public static let liveValue = MemoryClient.liveValue
    // public static let testValue = MemoryClient.testValue
}

// MARK: - Dependency Values

public extension DependencyValues {
    var memoryClient: MemoryClient {
        get { self[MemoryClientKey.self] }
        set { self[MemoryClientKey.self] = newValue }
    }
}
