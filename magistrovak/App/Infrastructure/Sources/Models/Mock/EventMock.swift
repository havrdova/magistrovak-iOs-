import Foundation

public extension Event {
    static let mockData: [Event] = [
        Event(
            id: "1",
            name: "Sraz na nádraží v Praze (Praha hl.n. - naproti hlavním pokladnám)",
            startTime: "12:00",
            endTime: "12:20",
            date: "1. 9. 2023"
        ),
        Event(
            id: "2",
            name: "Oběd",
            startTime: "11:30",
            endTime: "12:00",
            date: "1. 9. 2023"
        )
    ]

    static let mockDates: [String] = [
        "1. 9. 2023"
    ]
}
