import SwiftUI

// MARK: - Magistrovak Root View

@main
struct magistrovakApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ProgrammeView()
            }
        }
    }
}
