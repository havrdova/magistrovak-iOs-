import DataProviderClient
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
        case newsLoaded(TaskResult<[News]>)
    }

    // MARK: Dependency

    @Dependency(\.dataProviderClient) private var dataProviderClient

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchProgram:
                return .task {
                    await .newsLoaded(
                        TaskResult {
                            try await dataProviderClient.getNewsList()
                        }
                    )
                }

            case let .newsLoaded(.success(program)):
                state.allNews = program
                return .none

            case .newsLoaded(.failure):
                // TODO: implement
                return .none
            }
        }
    }
}
