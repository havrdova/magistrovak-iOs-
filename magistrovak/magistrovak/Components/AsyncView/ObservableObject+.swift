import Foundation

// MARK: - Loadable Object

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load() async
}
