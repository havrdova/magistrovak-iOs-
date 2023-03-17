import Foundation
import Models

// MARK: - UserDefaults Client interface

protocol UserDefaultsMemoryClientInterface {
    /// get functions
    func getProgramList() -> ([Event], [String])?
    func getNewsList() -> [News]?
    /// set functions
    func setProgramList(events: [Event], dates: [String]) -> Void
    func setNewsList(news: [News]) -> Void
}

// MARK: - UserDefaults Client

class UserDefaultsClient {
    private static let programEventsKey = "programEventsKey"
    private static let programDatesKey = "programDatesKey"
    private static let newsListKey = "newsListKey"
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
}

// MARK: - UserDefaults Client Interface Implementation

extension UserDefaultsClient: UserDefaultsMemoryClientInterface {
    func getProgramList() -> ([Models.Event], [String])? {
        guard let eventsData = userDefaults.object(forKey: UserDefaultsClient.programEventsKey) as? Data,
              let events = try? JSONDecoder().decode([Event].self, from: eventsData),
              let dates = userDefaults.object(forKey: UserDefaultsClient.programDatesKey) else {
            return nil
        }
        return (events, dates) as? ([Event], [String])
    }

    func getNewsList() -> [Models.News]? {
        guard let newsData = userDefaults.object(forKey: UserDefaultsClient.newsListKey) as? Data,
              let news = try? JSONDecoder().decode([News].self, from: newsData) else {
            return nil
        }
        return news
    }

    func setProgramList(events: [Models.Event], dates: [String]) {
        let eventsData = try? JSONEncoder().encode(events)
        userDefaults.set(eventsData, forKey: UserDefaultsClient.programEventsKey)
        userDefaults.set(dates, forKey: UserDefaultsClient.programDatesKey)
    }

    func setNewsList(news: [Models.News]) {
        let newsData = try? JSONEncoder().encode(news)
        userDefaults.set(newsData, forKey: UserDefaultsClient.newsListKey)
    }
}
