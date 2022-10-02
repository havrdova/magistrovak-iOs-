//
//  PlanMock.swift
//  magistrovak
//
//  Created by Lucie Havrdová on 29.09.2022.
//

import Foundation

extension Plan {
    static let day1 = [
        Plan(id: 1, name: "Chytání lelků", time: "8:00-9:00"),
        Plan(id: 2, name: "Pouštění lelků", time: "13:00-14:00")
    ]

    static let day2 = [
        Plan(id: 3, name: "Hlednání ztraceného času", time: "8:00-12:00"),
        Plan(id: 4, name: "Litování ztraceného času nad hledáním ztraceného času", time: "12:00-20:00")
    ]
}
