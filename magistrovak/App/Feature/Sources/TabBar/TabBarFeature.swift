import ComposableArchitecture
import Foundation
import Map
import News
import Program

// MARK: - TabBar Feature

public struct TabBarFeature: ReducerProtocol {

    public init() {}

    // MARK: State

    public struct State: Equatable {
        var programState: ProgramFeature.State
        var newsState: NewsFeature.State
        var mapState: MapFeature.State

        public init() {
            self.programState = ProgramFeature.State()
            self.newsState = NewsFeature.State()
            self.mapState = MapFeature.State()
        }
    }

    // MARK: Action

    public enum Action: Equatable {
        case programAction(ProgramFeature.Action)
        case newsAction(NewsFeature.Action)
        case mapAction(MapFeature.Action)
    }

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .programAction:
                return .none

            case .newsAction:
                return .none

            case .mapAction:
                return .none
            }
        }

        Scope(state: \.programState, action: /Action.programAction) {
            ProgramFeature()
        }

        Scope(state: \.newsState, action: /Action.newsAction) {
            NewsFeature()
        }

        Scope(state: \.mapState, action: /Action.mapAction) {
            MapFeature()
        }
    }
}
