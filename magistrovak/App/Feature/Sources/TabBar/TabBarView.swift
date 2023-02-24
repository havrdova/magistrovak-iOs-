import ComposableArchitecture
import Map
import News
import Program
import SwiftUI

// MARK: - Selected view

public enum Tabs: String {
    case program
    case news
    case map
}

// MARK: - TabBar View

public struct TabBarView: View {
    let store: StoreOf<TabBarFeature>

    public init(store: StoreOf<TabBarFeature>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            TabView(
                selection: viewStore.binding(
                    get: \.selectedTab,
                    send: TabBarFeature.Action.setSelectedView
                )
            ) {
                ProgramView(
                    store: self.store.scope(
                        state: \.programState,
                        action: TabBarFeature.Action.programAction
                    )
                )
                .tag(Tabs.program)
                .tabItem {
                    Label("Program", systemImage: "calendar") // TODO: add image
                }

                NewsView(
                    store: self.store.scope(
                        state: \.newsState,
                        action: TabBarFeature.Action.newsAction
                    )
                )
                .tag(Tabs.news)
                .tabItem {
                    Label("Novinky", systemImage: "newspaper") // TODO: add image
                }

                MapView(
                    store: self.store.scope(
                        state: \.mapState,
                        action: TabBarFeature.Action.mapAction
                    )
                )
                .tag(Tabs.map)
                .tabItem {
                    Label("Mapa", systemImage: "map") // TODO: add image
                }
            }
            .navigationTitle(viewStore.selectedTab.rawValue)
        }
    }
}

// MARK: - TabBar Preview

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(
            store: Store(
                initialState: TabBarFeature.State(),
                reducer: TabBarFeature()
            )
        )
    }
}
