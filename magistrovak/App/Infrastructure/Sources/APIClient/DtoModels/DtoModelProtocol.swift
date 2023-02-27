import Foundation

// MARK: - DTO Model Protocol

protocol DTOModelProtocol {
    associatedtype T

    var toModel: T { get }
}
