import ComposableArchitecture
import Foundation
import Models

// MARK: - Memory Client

public struct MemoryClient {
    /// returns list of events and list of dates
    public var getProgramList: () -> ([Event], [String])?
    public var getNewsList: () -> [News]?
    /// to save data to memory
    public var saveProgramList: ([Event], [String]) -> Void
    public var saveNewsList: ([News]) -> Void
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
