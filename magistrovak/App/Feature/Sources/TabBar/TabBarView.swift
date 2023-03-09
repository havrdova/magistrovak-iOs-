import ComposableArchitecture
import Map
import News
import Program
import SwiftUI

// MARK: - TabBar View

public struct TabBarView: View {
    let store: StoreOf<TabBarFeature>

    public init(store: StoreOf<TabBarFeature>) {
        self.store = store
        UITabBar.appearance().isTranslucent = false
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
                    Label(
                        Tabs.program.name(),
                        systemImage: Tabs.program.iconName()
                    )
                }

                NewsView(
                    store: self.store.scope(
                        state: \.newsState,
                        action: TabBarFeature.Action.newsAction
                    )
                )
                .tag(Tabs.news)
                .tabItem {
                    Label(
                        Tabs.news.name(),
                        systemImage: Tabs.news.iconName()
                    )
                }

                MapView(
                    store: self.store.scope(
                        state: \.mapState,
                        action: TabBarFeature.Action.mapAction
                    )
                )
                .tag(Tabs.map)
                .tabItem {
                    Label(
                        Tabs.map.name(),
                        systemImage: Tabs.map.iconName()
                    )
                }
            }
            .navigationTitle(viewStore.selectedTab.name())
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
