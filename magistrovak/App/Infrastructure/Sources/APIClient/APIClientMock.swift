import ComposableArchitecture
import Foundation
import Models

// MARK: - API Client Mock

extension APIClient: DependencyKey {
    public static var liveValue: APIClient {
        return mockValue
    }

    public static var mockValue: APIClient {
        return APIClient {
            return Event.mockData
        }
    }
}
