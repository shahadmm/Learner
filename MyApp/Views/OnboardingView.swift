//
//  OnboardingView.swift
//  MyApp
//
//  Created by shahad almaghrabi on 30/05/1448 AH.
//

import SwiftUI

struct OnboardingView: View {
    @State private var viewModel = OnboardingViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Image(systemName: "flame.fill")
                .font(.system(size: 40))
                .foregroundStyle(.orange)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Hello")
                    Text("Learner")
                        .bold()
                }
                .font(.largeTitle)

                Text("This app will help you learn everyday!")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }

            GoalForm(
                learningTopic: $viewModel.learningTopic,
                selectedPeriod: $viewModel.selectedPeriod
            )

            Spacer()

            VStack {
                Button("Start Learning", action: viewModel.startLearning)
                    .buttonStyle(.glassProminent)
                    .tint(.orange)
                    .disabled(!viewModel.canStartLearning)

                Text("You can edit your desire later")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(isPresented: $viewModel.didStartLearning) {
            ActivityView()
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingView()
    }
    .preferredColorScheme(.dark)
}
