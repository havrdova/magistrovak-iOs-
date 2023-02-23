import ComposableArchitecture
import Foundation

// MARK: - Program Feature

public struct ProgramFeature: ReducerProtocol {

    // MARK: State

    public struct State: Equatable {

    }

    // MARK: Action

    public enum Action: Equatable {

    }

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { _, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
