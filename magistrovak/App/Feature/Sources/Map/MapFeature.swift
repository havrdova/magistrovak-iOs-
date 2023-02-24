import ComposableArchitecture
import Foundation

// MARK: - Map Feature

public struct MapFeature: ReducerProtocol {

    public init() {}

    // MARK: State

    public struct State: Equatable {
        public init() {}
    }

    // MARK: Action

    public enum Action: Equatable {}

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
