//
//  Learner_Models.swift
//  MyApp
//
//  Created by shahad almaghrabi on 29/05/1448 AH.
//

import Foundation

enum LearningPeriod: String, CaseIterable, Codable {
    case week = "Week"
    case month = "Month"
    case year = "Year"

    var days: Int {
        switch self {
        case .week: 7
        case .month: 30
        case .year: 365
        }
    }

    var maxFreezes: Int {
        switch self {
        case .week: 2
        case .month: 8
        case .year: 96
        }
    }
}

