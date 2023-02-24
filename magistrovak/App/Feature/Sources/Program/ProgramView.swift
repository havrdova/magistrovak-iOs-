import ComposableArchitecture
import Models
import SwiftUI

// MARK: - Program View

public struct ProgramView: View {
    let store: StoreOf<ProgramFeature>

    public init(store: StoreOf<ProgramFeature>) {
        self.store = store
    }

    // MARK: Body

    public var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEach(viewStore.program) { event in
                    eventCell(event)
                }
            }
            .task {
                viewStore.send(.fetchProgram)
            }
        }
    }

    // MARK: Cell View

    func eventCell(_ event: Event) -> some View {
        VStack(alignment: .leading) {
            Text(event.name)
            Text(event.startTime)
            Text(event.endTime)
        }
    }
}

// MARK: - Program Preview

struct ProgramView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView(
            store: Store(
                initialState: ProgramFeature.State(),
                reducer: ProgramFeature()
            )
        )
    }
}
