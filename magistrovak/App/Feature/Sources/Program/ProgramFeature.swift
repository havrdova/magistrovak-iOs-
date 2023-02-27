import APIClient
import ComposableArchitecture
import Foundation
import Models

// MARK: - Program Feature

public struct ProgramFeature: ReducerProtocol {

    public init() {}

    // MARK: State

    public struct State: Equatable {
        var program: [Event] = []

        public init() {}
    }

    // MARK: Action

    public enum Action: Equatable {
        case fetchProgram
        case productLoaded(TaskResult<[Event]>)
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
                        let result = try await apiClient.getProgramList()
                        return .productLoaded(.success(result))
                    } catch {
                        return .productLoaded(.failure(error))
                    }
                }

//            case .fetchProgram:
//                let result = apiClient.getProgramList()
//                // TODO: check result
//                return EffectTask(value: .productLoaded(.success(result)))

            case let .productLoaded(.success(program)):
                state.program = program
                return .none

            case .productLoaded(.failure):
                // TODO: implement
                return .none
            }
        }
    }
}
