//
//  PeriodButton.swift
//  MyApp
//
//  Created by shahad almaghrabi on 30/05/1448 AH.
//

import SwiftUI

struct PeriodButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Text(title)
                .foregroundStyle(isSelected ? .orange : .gray)
                .padding(.horizontal,20)
                .padding(.vertical, 12)
        }
        .glassEffect(isSelected ? .regular.tint(.orange) : .regular)
    }
}

#Preview {
    PeriodButton(title: "Week", isSelected: true, action:{})
        .preferredColorScheme(.dark)
}
