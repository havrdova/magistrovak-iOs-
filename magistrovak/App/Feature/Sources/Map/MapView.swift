import ComposableArchitecture
import SwiftUI

// MARK: - Map View

public struct MapView: View {
    let store: StoreOf<MapFeature>

    public init(store: StoreOf<MapFeature>) {
        self.store = store
    }

    // MARK: Body

    public var body: some View {
        Text("Put map here.")
    }
}

// MARK: - Map Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            store: Store(
                initialState: MapFeature.State(),
                reducer: MapFeature()
            )
        )
    }
}
