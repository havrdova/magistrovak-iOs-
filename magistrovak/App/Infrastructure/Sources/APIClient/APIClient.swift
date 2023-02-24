import ComposableArchitecture
import Foundation
import Models

// MARK: - API Client

public struct APIClient {
    public var getProgramList: () -> [Event]
}

// MARK: - Dependency Key

public enum APIClientKey: DependencyKey {
    public static let liveValue = APIClient.mockValue
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
