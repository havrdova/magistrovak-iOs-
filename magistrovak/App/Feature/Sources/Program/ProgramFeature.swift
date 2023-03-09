import APIClient
import ComposableArchitecture
import Foundation
import Models
import UIToolkit

// MARK: - Program Feature

public struct ProgramFeature: ReducerProtocol {

    public init() {}

    // MARK: State

    public struct State: Equatable {
        var program: [Event] = []
        var dates: [String] = []

        public init() {}
    }

    // MARK: Action

    public enum Action: Equatable {
        case fetchProgram
        case productLoaded(TaskResult<([Event], [String])>)

        public static func == (lhs: ProgramFeature.Action, rhs: ProgramFeature.Action) -> Bool {
            false // TODO: think about it again
        }
    }

    // MARK: Dependency

    @Dependency(\.apiClient) private var apiClient

    // MARK: Reducer

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchProgram:
                return .task {
                    await .productLoaded(
                        TaskResult {
                            try await apiClient.getProgramList()
                        }
                    )
                }

            case let .productLoaded(.success((program, dates))):
                state.program = program
                state.dates = dates
                return .none

            case .productLoaded(.failure):
                // TODO: implement
                return .none
            }
        }
    }
}
