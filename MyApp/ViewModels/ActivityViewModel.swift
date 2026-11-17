//
//  ActivityViewModel.swift
//  MyApp
//
//  Created by shahad almaghrabi on 06/06/1448 AH.
//

import Foundation
import Observation
@Observable

class ActivityViewModel {
    
    var today: Date = .now
    
    private let dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter
    }()
    
    var todayText: String {
        
        dateFormatter .string(from: today)
    }
        var learnedDays: Int = 4
        var freezedDays: Int = 0

        var learnedText: String {
            daysText(learnedDays)
        }

        var freezedText: String {
            daysText(freezedDays)
        }
    var isLoggedToday: Bool = false

    var logButtonTitle: String {
        isLoggedToday ? "Logged as Learned" : "Log as Learned"
    }

    func logAsLearned() {
        learnedDays += 1
        isLoggedToday = true
    }
    var isFreezedToday: Bool = false
    let maxFreezes: Int = 2

    var canFreeze: Bool {
        !isLoggedToday && !isFreezedToday && freezedDays < maxFreezes
    }

    var freezeButtonTitle: String {
        isFreezedToday ? "Freezed for a day" : "Freeze for a day"
    }

    var freezesUsedText: String {
        "\(freezedDays) out of \(maxFreezes) Freezes used"
    }

    func freezeToday() {
        freezedDays += 1
        isFreezedToday = true
    }

        private func daysText(_ count: Int) -> String {
            count == 1 ? "1 day" : "\(count) days"
        }
    }


    
