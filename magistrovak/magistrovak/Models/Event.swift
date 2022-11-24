import Foundation

// MARK: - Event Model

struct Event: Identifiable, Equatable {
    let id: String
    let start: String
    let end: String
    let name: String

    var duration: String {
        "\(start) - \(end)"
    }
}
