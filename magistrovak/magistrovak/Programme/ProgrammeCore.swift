import ComposableArchitecture
import Foundation

// MARK: - Programme Reducer

struct Programme: ReducerProtocol {
    struct State: Equatable {

    }

    enum Action: Equatable {
        case onAppear
        case dataLoaded
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none

            case .dataLoaded:
                return .none
                
            }
        }
    }


}
