import Foundation

// MARK: - API Error

enum APIError: Error {
    case downloadError
    case decodingError

    case mapingDTOError
}

extension APIError: Equatable {}
