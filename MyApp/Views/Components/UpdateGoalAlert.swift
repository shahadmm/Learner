//
//  UpdateGoalAlert.swift
//  MyApp
//
//  Created by shahad almaghrabi on 08/06/1448 AH.
//

import SwiftUI

struct UpdateGoalAlert: View {
    let onDismiss: () -> Void
    let onUpdate: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                Text("Update goal")
                    .font(.headline)

                Text("If you update now, your streak will start over.")
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                HStack(spacing: 12) {
                    Button(action: onDismiss) {
                        Text("Dismiss")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Capsule().fill(.gray.opacity(0.3)))
                    }

                    Button(action: onUpdate) {
                        Text("Update")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Capsule().fill(.orange))
                    }
                }
            }
            .padding(24)
            .glassEffect(in: .rect(cornerRadius: 32))
            .padding(40)
        }
    }
}

#Preview {
    UpdateGoalAlert(onDismiss: {}, onUpdate: {})
        .preferredColorScheme(.dark)
}
