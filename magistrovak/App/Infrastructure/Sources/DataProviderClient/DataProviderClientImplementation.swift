import APIClient
import ComposableArchitecture
import Foundation
import MemoryClient
import Models

extension DataProviderClient: DependencyKey {

    // MARK: - DataProviderClient Live

    public static var liveValue: DataProviderClient {

        @Dependency(\.apiClient) var apiClient
        @Dependency(\.memoryClient) var memoryClient

        return DataProviderClient(
            getProgramList: {
                var result: ([Event], [String])
                do {
                    result = try await apiClient.getProgramList()
                } catch {
                    result = memoryClient.getProgramList()
                }

                return result
            },
            getNewsList: {
                var result: [News]

                do {
                    result = try await apiClient.getNewsList()
                } catch {
                    result = memoryClient.getNewsList()
                }

                return result
            }
        )
    }


    // MARK: - DataProviderClient Mock

    public static var mockValue: DataProviderClient {
        return DataProviderClient(
            getProgramList: {
                return (Event.mockData, Event.mockDates)
            },
            getNewsList: {
                return News.mockData
            }
        )
    }
}

