import Foundation

// MARK: - API Error

enum APIError: Error {
    case downloadError
    case decodingError
    case invalidStatusCode
    case rocketNotFound

    // HTTP errors
    case informationalResponse
    case redirectionResponse
    case clientErrorResponse
    case serverErrorResponse
    case other

    case invalidURL
}
