import ComposableArchitecture
import Foundation
import Program
import News

// MARK: - TabBar Feature

public struct TabBarFeature: ReducerProtocol {

    public init() {}

    // MARK: State

    public struct State: Equatable {
        var programState: ProgramFeature.State
        var newsState: NewsFeature.State

        public init() {
            self.programState = ProgramFeature.State()
            self.newsState = NewsFeature.State()
        }
    }

    // MARK: Action

    public enum Action: Equatable {
        case programAction(ProgramFeature.Action)
        case newsAction(NewsFeature.Action)
    }

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .programAction:
                return .none

            case .newsAction(_):
                return .none
            }
        }

        Scope(state: \.programState, action: /Action.programAction) {
            ProgramFeature()
        }
        Scope(state: \.newsState, action: /Action.newsAction) {
            NewsFeature()
        }
    }
}
