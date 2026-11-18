import Foundation
import Observation

@Observable
class ActivityViewModel {
    var goal: LearningGoal?

    private let calendar = Calendar.current

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter
    }()

    func load() {
        goal = GoalStorage.load()
        resetStreakIfNeeded()
    }

    // MARK: Header

    var todayText: String {
        dateFormatter.string(from: .now)
    }

    // MARK: Week

    var weekDays: [Date] {
        let today = calendar.startOfDay(for: .now)
        let weekday = calendar.component(.weekday, from: today) // 1 = Sunday
        var days: [Date] = []
        for offset in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: offset - (weekday - 1), to: today) {
                days.append(day)
            }
        }
        return days
    }

    func weekdayLetter(_ date: Date) -> String {
        calendar.veryShortWeekdaySymbols[calendar.component(.weekday, from: date) - 1]
    }

    func status(on date: Date) -> DayStatus? {
        goal?.status(on: date)
    }

    // MARK: Stats

    var learnedText: String {
        daysText(count(.learned, since: goal?.streakStartDate))
    }

    var freezedText: String {
        daysText(count(.freezed, since: goal?.streakStartDate))
    }

    // MARK: Log

    var isLearnedToday: Bool {
        status(on: .now) == .learned
    }

    var logButtonTitle: String {
        isLearnedToday ? "Logged as Learned" : "Log as Learned"
    }

    func logAsLearned() {
        record(.learned)
    }

    // MARK: Freeze

    var maxFreezes: Int {
        goal?.period.maxFreezes ?? 0
    }

    var freezesUsed: Int {
        count(.freezed, since: goal?.startDate)
    }

    var canFreeze: Bool {
        status(on: .now) == nil && freezesUsed < maxFreezes
    }

    var freezeButtonTitle: String {
        status(on: .now) == .freezed ? "Freezed for a day" : "Freeze for a day"
    }

    var freezesUsedText: String {
        "\(freezesUsed) out of \(maxFreezes) Freezes used"
    }

    func freezeToday() {
        record(.freezed)
    }

    // MARK: Goal end

    var isGoalFinished: Bool {
        guard let goal,
              let endDate = calendar.date(byAdding: .day, value: goal.period.days, to: calendar.startOfDay(for: goal.startDate))
        else { return false }
        return Date.now >= endDate
    }

    var isGoalMet: Bool {
        guard let goal else { return false }
        let doneDays = count(.learned, since: goal.startDate) + count(.freezed, since: goal.startDate)
        return doneDays >= goal.period.days
    }

    var finishIcon: String {
        isGoalMet ? "hands.clap.fill" : "exclamationmark.circle.fill"
    }

    var finishTitle: String {
        isGoalMet ? "Well done!" : "You didn't reach your goal this time."
    }

    var finishMessage: String {
        isGoalMet ? "Ready for your next goal?" : "Want to set another goal?"
    }

    // MARK: Private

    private func record(_ status: DayStatus) {
        guard var goal else { return }
        goal.log[calendar.startOfDay(for: .now)] = status
        goal.lastLoggedAt = .now
        save(goal)
    }

    private func resetStreakIfNeeded() {
        guard var goal else { return }
        let lastActivity = goal.lastLoggedAt ?? goal.startDate
        let hoursPassed = Date.now.timeIntervalSince(lastActivity) / 3600
        if hoursPassed > 32 {
            goal.streakStartDate = .now
            save(goal)
        }
    }

    private func save(_ goal: LearningGoal) {
        self.goal = goal
        GoalStorage.save(goal)
    }

    private func count(_ status: DayStatus, since date: Date?) -> Int {
        guard let goal, let date else { return 0 }
        let start = calendar.startOfDay(for: date)
        return goal.log.filter { $0.key >= start && $0.value == status }.count
    }

    private func daysText(_ count: Int) -> String {
        count == 1 ? "1 day" : "\(count) days"
    }
}
