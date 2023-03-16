import ComposableArchitecture
import Foundation
import Models

// MARK: - Data Provider Client

public struct DataProviderClient {
    public var getProgramList: () async throws -> ([Event], [String])
    public var getNewsList: () async throws -> [News]
}

// MARK: - Dependency Key

public enum DataProviderClientKey: DependencyKey {
    public static let liveValue = DataProviderClient.liveValue
}

// MARK: - Dependency Key

public extension DependencyValues {
    var dataProviderClient: DataProviderClient {
        get { self[DataProviderClientKey.self] }
        set { self[DataProviderClientKey.self] = newValue }
    }
}
