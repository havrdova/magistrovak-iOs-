import ComposableArchitecture
import SwiftUI
import TabBar

@main
struct Magistrovak: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabBarView(
                    store: Store(
                        initialState: TabBarFeature.State(),
                        reducer: TabBarFeature()
                    )
                )
            }
            .navigationViewStyle(.stack)
        }
    }
}
