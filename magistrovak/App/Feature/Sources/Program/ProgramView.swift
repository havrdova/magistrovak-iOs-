import ComposableArchitecture
import SwiftUI

// MARK: - Program View

public struct ProgramView: View {
    let store: StoreOf<ProgramFeature>

    public init(store: StoreOf<ProgramFeature>) {
        self.store = store
    }

    public var body: some View {
        // TODO: implement
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
