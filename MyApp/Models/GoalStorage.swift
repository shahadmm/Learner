//
//  GoalStorage.swift
//  MyApp
//
//  Created by shahad almaghrabi on 08/06/1448 AH.
//

import Foundation
struct GoalStorage {
    private static let key = "learningGoal"

    static func load() -> LearningGoal? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(LearningGoal.self, from: data)
    }

    static func save(_ goal: LearningGoal) {
        guard let data = try? JSONEncoder().encode(goal) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
