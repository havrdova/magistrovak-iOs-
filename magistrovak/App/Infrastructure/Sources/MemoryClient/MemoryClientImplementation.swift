import ComposableArchitecture
import Foundation
import Models

extension MemoryClient: DependencyKey {

    // MARK: - Live Value

    public static var liveValue: MemoryClient {
        return MemoryClient(
            getProgramList: {
                // TODO: implement
                mockValue.getProgramList()
            },
            getNewsList: {
                // TODO: implement
                mockValue.getNewsList()
            }
        )
    }

    // MARK: - Mock Value

    public static var mockValue: MemoryClient {
        return MemoryClient(
            getProgramList: {
                return (Event.mockData, Event.mockDates)
            },
            getNewsList: {
                return News.mockData
            }
        )
    }
}
