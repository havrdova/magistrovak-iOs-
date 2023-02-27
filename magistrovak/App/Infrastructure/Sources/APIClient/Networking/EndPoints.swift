import CoreToolkit
import Foundation

// MARK: - Endpoints for Magistrovak/Seznamovak API

enum ApiEndpoints {
    case programList
    case newsList
}

extension ApiEndpoints {

    // MARK: Endpoint URL Paht

    var path: String {
        switch self {
        case .programList:
            return Constants.Networking.program
        case .newsList:
            return Constants.Networking.news
        }
    }

    // MARK: Url

    var url: String {
        switch self {
        case .programList:
            return Constants.Networking.baseUrl + Constants.Networking.program
        case .newsList:
            return Constants.Networking.baseUrl + Constants.Networking.news
        }
    }

    // MARK: Method

    var method: String {
        switch self {
        default:
            return "GET"
        }
    }

    // MARK: URL Request creation
    // TODO: remove exclamation marks
    
    var request: URLRequest {
        var urlComponents = URLComponents(string: Constants.Networking.baseUrl)!
        urlComponents.path = path

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = method

        return request
    }
}
