import Foundation

// MARK: Loading State

enum Loadable<Value, Error> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}

extension Loadable: Equatable where Value: Equatable, Error: Equatable {}
