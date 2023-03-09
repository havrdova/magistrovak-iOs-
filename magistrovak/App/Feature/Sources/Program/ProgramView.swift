import ComposableArchitecture
import Models
import SwiftUI
import UIToolkit

// MARK: - Program View

public struct ProgramView: View {
    let store: StoreOf<ProgramFeature>

    public init(store: StoreOf<ProgramFeature>) {
        self.store = store
    }

    // MARK: Body

    public var body: some View {
        WithViewStore(store) { viewStore in
            GeometryReader { geo in
                VStack {
                    ReversedTabsView(
                        tabs: viewStore.dates,
                        geoWidth: geo.size.width,
                        selectedTab: .init(
                            get: { viewStore.selectedTab },
                            set: { tabIdx in
                                viewStore.send(.setSelectedTab(idx: tabIdx))
                            }
                        )
                    )

                    List {
                        ForEach(viewStore.dayProgram) { event in
                            eventCell(event)
                        }
                    }
                    .task {
                        await viewStore.send(.fetchProgram).finish()
                    }
                }
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
