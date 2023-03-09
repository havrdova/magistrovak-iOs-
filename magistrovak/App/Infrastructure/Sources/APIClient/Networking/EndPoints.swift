import CoreToolkit
import Foundation

// MARK: - Endpoints for Magistrovak/Seznamovak API

enum ApiEndpoints {
    case programList
    case newsList
}

extension ApiEndpoints {

    // MARK: Scheme

    var scheme: String {
        switch self {
        default:
            return Constants.Networking.scheme
        }
    }

    // MARK: Host

    var host: String {
        switch self {
        default:
            return Constants.Networking.host
        }
    }

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

    func request() throws -> URLRequest {
        // TODO: create the url different way
        
        guard let url = URL(string: self.scheme + "://" + self.host + "/" + self.path) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        return request
    }
}
