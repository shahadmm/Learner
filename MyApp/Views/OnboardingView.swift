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
        VStack (alignment: .leading, spacing: 32){
            
            Image(systemName: "flame.fill")
                .font(.system(size:40))
                .foregroundStyle(.orange)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
            
            // قسم الترحيب
            VStack(alignment: .leading, spacing:4){
                HStack{
                    Text("Hello")
                    Text("Learner")
                        .bold()
                }
                .font(.largeTitle)
                
                Text("This app will help you learn everyday!")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            // قسم الموضوع والمدة
         
            GoalForm(
                learningTopic: $viewModel.learningTopic,
                selectedPeriod: $viewModel.selectedPeriod
            )
            // الزر الي تحت
            Spacer()
            
            VStack{
                Button("Start Learning", action:viewModel .startLearning)
                    .disabled(!viewModel.canStartLearning)
                    .buttonStyle (.glassProminent)
                    .tint (.orange)
                Text("You can edit your desire later")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            .frame(maxWidth: .infinity)
            
            
        }
        .padding()
    }
}
#Preview {
        OnboardingView()
        .preferredColorScheme(.dark)
}
 

