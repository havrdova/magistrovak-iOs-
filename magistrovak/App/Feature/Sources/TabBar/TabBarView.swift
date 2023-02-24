import ComposableArchitecture
import Program
import SwiftUI

// MARK: - TabBar View

public struct TabBarView: View {

    public init() {}

    public var body: some View {
        ProgramView(
            store: Store(
                initialState: ProgramFeature.State(),
                reducer: ProgramFeature()
            )
        )
    }
}

// MARK: - TabBar Preview

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
