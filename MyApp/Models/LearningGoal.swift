//
//  LearningGoal.swift
//  MyApp
//
//  Created by shahad almaghrabi on 08/06/1448 AH.
//

import Foundation
struct LearningGoal: Codable {
    var topic: String
    var period: LearningPeriod
    var startDate: Date = .now
    var streakStartDate: Date = .now
    var lastLoggedAt: Date?
    var log: [Date: DayStatus] = [:]

    func status(on date: Date) -> DayStatus? {
        log[Calendar.current.startOfDay(for: date)]
    }
}
