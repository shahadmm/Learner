import Foundation
import Observation

@Observable
class LearningGoalViewModel {
    var learningTopic: String                                  // 🆕 بدون = ""
    var selectedPeriod: LearningPeriod                         // 🆕 بدون = .week
    var isShowingUpdateAlert: Bool = false

    init() {
        let goal = GoalStorage.load()
        learningTopic = goal?.topic ?? ""
        selectedPeriod = goal?.period ?? .week
    }

    func showUpdateAlert() {
        isShowingUpdateAlert = true
    }

    func updateGoal() {
        var goal = GoalStorage.load() ?? LearningGoal(topic: learningTopic, period: selectedPeriod)   // 🆕
        goal.topic = learningTopic                             // 🆕
        goal.period = selectedPeriod                           // 🆕
        goal.startDate = .now                                  // 🆕
        goal.streakStartDate = .now                            // 🆕
        GoalStorage.save(goal)                                 // 🆕
    }
}
