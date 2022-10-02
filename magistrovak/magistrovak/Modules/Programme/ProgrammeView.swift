import ComposableArchitecture
import SwiftUI

// MARK: - Programme State

struct ProgrammeState: Equatable {
    var programme: Loadable<[Plan], APIError> = .idle
}

// MARK: - Programme Actions

enum ProgrammeAction: Equatable {
    case onAppear
    case loadedData
}

// MARK: - Programme View

struct ProgrammeView: View {
    @ObservedObject var viewStore: ViewStore<ProgrammeState, ProgrammeAction>
    let store: Store<ProgrammeState, ProgrammeAction>

    init(store: Store<ProgrammeState, ProgrammeAction>) {
        self.store = store
        self.viewStore = ViewStore(store)
    }

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

// MARK: - Day View

struct DayView: View {
    let store: Store<ProgrammeState, ProgrammeAction>
    let day: [Plan] = []

    var body: some View {
        WithViewStore(self.store) { viewStore in
            List(day) { event in
                Cell(time: event.time, name: event.time)
            }
        }
    }

    struct Cell: View {
        let time: String
        let name: String

        var body: some View {
            VStack {
                Text(self.time)
                Text(self.name)
            }
        }
    }
}

// MARK: - ProgrammeView Preview

struct ProgrammeView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammeView(store: Store(
            initialState: ProgrammeState(),
            reducer: programmeReducer,
            environment: ProgrammeEnvironment()
        ))
    }
}
