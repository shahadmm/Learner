//
//  ActivityView.swift
//  MyApp
//
//  Created by shahad almaghrabi on 06/06/1448 AH.
//

import SwiftUI

struct ActivityView: View {
    @State private var viewModel = ActivityViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {

            // 1️⃣ الرأس
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Activity")
                        .font(.largeTitle)
                        .bold()

                    Text(viewModel.todayText)
                        .foregroundStyle(.gray)
                }

                Spacer()

                Button(action: { }) {
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

            // 3️⃣ العدادات
            HStack(spacing: 12) {
                StatCard(
                    iconName: "flame.fill",
                    iconColor: .orange,
                    title: viewModel.learnedText,
                    subtitle: "Learned"
                )

                StatCard(
                    iconName: "snowflake",
                    iconColor: .cyan,
                    title: viewModel.freezedText,
                    subtitle: "Freezed"
                )
            }

            // 4️⃣ الزر الكبير
            Button(action: viewModel.logAsLearned) {
                Text(viewModel.logButtonTitle)
                    .font(.title2)
                    .bold()
                    .frame(width: 260, height: 260)
            }
            .buttonStyle(.glassProminent)
            .buttonBorderShape(.circle)
            .tint(.orange)
            .disabled(viewModel.isLoggedToday)
            .frame(maxWidth: .infinity)

            Spacer()

            // 5️⃣ Freeze
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
        .padding()
    }
}

#Preview {
    NavigationStack {
        ActivityView()
    }
    .preferredColorScheme(.dark)
}
