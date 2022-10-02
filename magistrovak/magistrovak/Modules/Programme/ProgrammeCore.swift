import ComposableArchitecture
import Foundation

// MARK: - Programme Environment

struct ProgrammeEnvironment {

}

// MARK: - Programme Reducer

let programmeReducer = Reducer<
    ProgrammeState,
    ProgrammeAction,
    ProgrammeEnvironment
>{ state, action, environment in
    return .none
}
