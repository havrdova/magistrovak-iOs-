import ComposableArchitecture
import Foundation
import Models

extension APIClient: DependencyKey {

    // MARK: - API Client Live

    public static var liveValue: APIClient {
        return APIClient(
            getProgramList: {
                let networkManager = NetworkManager()
                let request = ApiEndpoints.programList.request
                let dto: ProgramDTO = try await networkManager.getDataFromRequest(request())

                let result: [Event] = dto.toModel
                let dates: [String] = dto.datesStrings

                return (result, dates)
            },
            getNewsList: {
                let networkManager = NetworkManager()
                let request = ApiEndpoints.newsList.request
                let dto: AllNewsDTO = try await networkManager.getDataFromRequest(request())

                let result: [News] = dto.toModel

                return result
            }
        )
    }

    // MARK: - API Client Mock

    public static var mockValue: APIClient {
        return APIClient(
            getProgramList: {
                return (Event.mockData, Event.mockDates)
            },
            getNewsList: {
                return News.mockData
            }
        )
    }
}
