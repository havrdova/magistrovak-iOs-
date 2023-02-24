import APIClient
import ComposableArchitecture
import Foundation
import Models

// MARK: - News Feature

public struct NewsFeature: ReducerProtocol {

    public init() {}

    // MARK: State

    public struct State: Equatable {
        var allNews: [News] = []

        public init() {}
    }

    // MARK: Action

    public enum Action: Equatable {
        case fetchProgram
        case productLoaded(TaskResult<[News]>)
    }

    // MARK: Dependency

    @Dependency(\.apiClient) private var apiClient

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchProgram:
                let result = apiClient.getNewsList()
                // TODO: check result
                return EffectTask(value: .productLoaded(.success(result)))

            case let .productLoaded(.success(program)):
                state.allNews = program
                return .none

            case .productLoaded(.failure):
                // TODO: implement
                return .none
            }
        }
    }
}
