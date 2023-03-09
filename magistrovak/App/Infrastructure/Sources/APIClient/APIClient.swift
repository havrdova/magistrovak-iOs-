import ComposableArchitecture
import Foundation
import Models

// MARK: - API Client

public struct APIClient {
    /// returns list of events and list od dates
    public var getProgramList: () async throws -> ([Event], [String])
    public var getNewsList: () async throws -> [News]
}

// MARK: - Dependency Key

public enum APIClientKey: DependencyKey {
    public static let liveValue = APIClient.liveValue
    // public static let liveValue = APIClient.liveValue
    // public static let testValue = APIClient.testValue
}

// MARK: - Dependency Values

public extension DependencyValues {
    var apiClient: APIClient {
        get { self[APIClientKey.self] }
        set { self[APIClientKey.self] = newValue }
    }
}
