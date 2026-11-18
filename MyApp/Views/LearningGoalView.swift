import SwiftUI

struct LearningGoalView: View {
    @State private var viewModel = LearningGoalViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            GoalForm(
                learningTopic: $viewModel.learningTopic,
                selectedPeriod: $viewModel.selectedPeriod
            )

            Spacer()
        }
        .padding()
        .navigationTitle("Learning Goal")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: viewModel.showUpdateAlert) {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.glassProminent)
                .tint(.orange)
            }
        }
        .alert("Update goal", isPresented: $viewModel.isShowingUpdateAlert) {
            Button("Dismiss", role: .cancel) { }
            Button("Update") {
                viewModel.updateGoal()
                dismiss()
            }                                               
        } message: {
            Text("If you update now, your streak will start over.")
        }
    }
}

#Preview {
    NavigationStack {
        LearningGoalView()
    }
    .preferredColorScheme(.dark)
}
