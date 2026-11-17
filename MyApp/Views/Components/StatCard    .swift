//
//  StatCard    .swift
//  MyApp
//
//  Created by shahad almaghrabi on 07/06/1448 AH.
//

import SwiftUI

struct StatCard: View {
    let iconName: String
    let iconColor : Color
    let title: String
    let subtitle:String
    
    var body: some View {
        VStack(spacing:4){
            Image(systemName: iconName)
                .font(.title2)
                .foregroundStyle(iconColor)
            
            Text(title)
                .bold()
            Text(subtitle)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical,16)
        .glassEffect(in: .rect(cornerRadius:24))
    }
}

#Preview {
    StatCard(
        iconName: "flame.fill" ,
        iconColor: .orange,
        title: "4 days",
        subtitle: "Learned"
    )
    .padding()
    .preferredColorScheme(.dark)
}
