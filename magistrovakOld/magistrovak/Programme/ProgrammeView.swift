import ComposableArchitecture
import SwiftUI

// MARK: - Programme View

struct ProgrammeView: View {
    let store: StoreOf<Programme>

    var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEach(viewStore.events) { event in
                    CellView(title: event.name, subtitle: event.duration)
                }
            }
        }
    }
}

// MARK: - Programme View Preview

struct ProgrammeView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammeView(store: Store(
            initialState: Programme.State(),
            reducer: Programme()
        ))
    }
}
