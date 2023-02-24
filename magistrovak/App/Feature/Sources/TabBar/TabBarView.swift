import ComposableArchitecture
import News
import Program
import SwiftUI

// MARK: - TabBar View

public struct TabBarView: View {
    let store: StoreOf<TabBarFeature>

    public init(store: StoreOf<TabBarFeature>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { viewStore in
            TabView {
                ProgramView(
                    store: self.store.scope(
                        state: \.programState,
                        action: TabBarFeature.Action.programAction
                    )
                )
                .tabItem {
                    Label("Program", systemImage: "calendar") // TODO: add image
                }

                NewsView(
                    store: self.store.scope(
                        state: \.newsState,
                        action: TabBarFeature.Action.newsAction
                    )
                )
                .tabItem {
                    Label("Novinky", systemImage: "newspaper") // TODO: add image
                }
            }
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
