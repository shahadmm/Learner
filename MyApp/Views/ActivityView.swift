import SwiftUI

struct ActivityView: View {
    @State private var viewModel = ActivityViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            header
            weekStrip
            stats

            if viewModel.isGoalFinished {
                goalFinished
                Spacer()
            } else {
                logButton
                Spacer()
                freezeSection
            }
        }
        .padding()
        .toolbar(.hidden, for: .navigationBar)
        .onAppear(perform: viewModel.load)
    }

    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Activity")
                    .font(.largeTitle)
                    .bold()

                Text(viewModel.todayText)
                    .foregroundStyle(.gray)
            }

            Spacer()

            NavigationLink {
                CalendarView()
            } label: {
                Image(systemName: "calendar")
            }
            
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)

            NavigationLink {
                LearningGoalView()
            } label: {
                Image(systemName: "pencil.and.outline")
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
        }
    }

    private var weekStrip: some View {
        HStack {
            ForEach(viewModel.weekDays, id: \.self) { day in
                VStack(spacing: 8) {
                    Text(viewModel.weekdayLetter(day))
                        .font(.caption)
                        .bold()

                    DayCircle(date: day, status: viewModel.status(on: day))
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var stats: some View {
        HStack(spacing: 12) {
            StatCard(iconName: "flame.fill", iconColor: .orange, title: viewModel.learnedText, subtitle: "Learned")
            StatCard(iconName: "snowflake", iconColor: .cyan, title: viewModel.freezedText, subtitle: "Freezed")
        }
    }

    private var logButton: some View {
        Button(action: viewModel.logAsLearned) {
            Text(viewModel.logButtonTitle)
                .font(.title2)
                .bold()
                .frame(width: 260, height: 260)
        }
        .buttonStyle(.glassProminent)
        .buttonBorderShape(.circle)
        .tint(.orange)
        .disabled(viewModel.isLearnedToday)
        .frame(maxWidth: .infinity)
    }

    private var freezeSection: some View {
        VStack(spacing: 8) {
            Button(action: viewModel.freezeToday) {
                Text(viewModel.freezeButtonTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.glassProminent)
            .tint(.cyan)
            .disabled(!viewModel.canFreeze)

            Text(viewModel.freezesUsedText)
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }

    private var goalFinished: some View {
        VStack(spacing: 12) {
            Image(systemName: viewModel.finishIcon)
                .font(.system(size: 40))
                .foregroundStyle(.orange)

            Text(viewModel.finishTitle)
                .bold()

            Text(viewModel.finishMessage)
                .font(.caption)
                .foregroundStyle(.gray)

            NavigationLink("Set a goal") {
                LearningGoalView()
            }
            .buttonStyle(.glassProminent)
            .tint(.orange)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 40)
    }
}

#Preview {
    NavigationStack {
        ActivityView()
    }
    .preferredColorScheme(.dark)
}
