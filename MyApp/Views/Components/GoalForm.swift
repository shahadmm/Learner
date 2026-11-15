//
//  GoalForm.swift
//  MyApp
//
//  Created by shahad almaghrabi on 03/06/1448 AH.
//

import SwiftUI

struct GoalForm: View {
    @Binding var learningTopic: String
    @Binding var selectedPeriod: LearningPeriod
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            // قسم الموضوع
            VStack(alignment: .leading, spacing: 12){
                Text("I want to learn ")
                TextField("Swift", text: $learningTopic)
                Divider()
            }
            // قسم المدة
            VStack(alignment:.leading, spacing: 12){
                Text("I want to learn it in a")
                HStack{
                    ForEach(LearningPeriod.allCases, id: \.self) { period in
                        PeriodButton(
                            title: period.rawValue,
                            isSelected: selectedPeriod == period,
                            action: {selectedPeriod = period}
                        )
                        
                        
                        
                        
                    }
                }
                
            }
        }
    }
}
#Preview {
    GoalForm(
        learningTopic: .constant(""),
        selectedPeriod: .constant(.week)
    )
    .padding()
    .preferredColorScheme(.dark)
}
