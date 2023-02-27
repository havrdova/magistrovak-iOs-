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
        case newsLoaded(TaskResult<[News]>)
    }

    // MARK: Dependency

    @Dependency(\.apiClient) private var apiClient

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchProgram:
                return .task {
                    do {
                        let result = try await apiClient.getNewsList()
                        return .newsLoaded(.success(result))
                    } catch {
                        return .newsLoaded(.failure(error))
                    }
                }
//            case .fetchProgram:
//                let result = apiClient.getNewsList()
//                // TODO: check result
//                return EffectTask(value: .productLoaded(.success(result)))

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
