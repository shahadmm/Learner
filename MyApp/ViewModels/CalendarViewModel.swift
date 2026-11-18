//
//  CalendarViewModel.swift
//  MyApp
//
//  Created by shahad almaghrabi on 08/06/1448 AH.
//

import Foundation
import Observation

struct CalendarMonth: Identifiable {
    let id: Date        // first day of the month
    let title: String
    let emptyDays: Int  // empty cells before day 1
    let days: [Date]
}

@Observable
class CalendarViewModel {
    private let calendar = Calendar.current
    private let goal = GoalStorage.load()

    private let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()

    var weekdayNames: [String] {
        calendar.shortWeekdaySymbols.map { $0.uppercased() }
    }

    var months: [CalendarMonth] {
        guard let goal else { return [] }
        let firstDate = ([goal.startDate] + goal.log.keys).min() ?? goal.startDate
        
        let goalEndDate = calendar.date(byAdding: .day, value: goal.period.days, to: goal.startDate) ?? .now
        
        var monthStart = calendar.dateInterval(of: .month, for: firstDate)?.start ?? firstDate
        var result: [CalendarMonth] = []
        
        while monthStart <= max(goalEndDate, .now){
    
            result.append(makeMonth(from: monthStart))
            guard let nextMonth = calendar.date(byAdding: .month, value: 1, to: monthStart) else { break }
            monthStart = nextMonth
        }
        return result
    }

    func status(on date: Date) -> DayStatus? {
        goal?.status(on: date)
    }

    private func makeMonth(from monthStart: Date) -> CalendarMonth {
        let dayCount = calendar.range(of: .day, in: .month, for: monthStart)?.count ?? 30
        var days: [Date] = []
        for offset in 0..<dayCount {
            if let day = calendar.date(byAdding: .day, value: offset, to: monthStart) {
                days.append(day)
            }
        }
        return CalendarMonth(
            id: monthStart,
            title: monthFormatter.string(from: monthStart),
            emptyDays: calendar.component(.weekday, from: monthStart) - 1,
            days: days
        )
    }
}
