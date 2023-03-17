import ComposableArchitecture
import Foundation
import Models

extension MemoryClient: DependencyKey {

    // MARK: - Live Value

    public static var liveValue: MemoryClient {
        let userDefaults = UserDefaults()
        let programListKey = "programListKey"
        var userDefaultsClient = UserDefaultsClient()

        return MemoryClient(
            getProgramList: {
                userDefaultsClient.getProgramList()
            },
            getNewsList: {
                userDefaultsClient.getNewsList()
            },
            saveProgramList: { events, dates in
                userDefaultsClient.setProgramList(events: events, dates: dates)
            },
            saveNewsList: { news in
                userDefaultsClient.setNewsList(news: news)
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
            },
            saveProgramList: { events, dates in
                // TODO: implement
            },
            saveNewsList: { news in
                // TODO: implement
            }
        )
    }
}
