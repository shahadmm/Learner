//
//  DayCircle.swift
//  MyApp
//
//  Created by shahad almaghrabi on 08/06/1448 AH.
//

import SwiftUI

struct DayCircle: View {
    let date: Date
    let status: DayStatus?

    var body: some View {
        Text("\(Calendar.current.component(.day, from: date))")
            .font(.title3)
            .bold()
            .foregroundStyle(textColor)
            .frame(width: 40, height: 40)
            .background(Circle().fill(backgroundColor))
    }

    private var isToday: Bool {
        Calendar.current.isDateInToday(date)
    }

    private var textColor: Color {
        switch status {
        case .learned: .orange
        case .freezed: .cyan
        case nil: isToday ? .white : .primary
        }
    }

    private var backgroundColor: Color {
        switch status {
        case .learned: .orange.opacity(0.2)
        case .freezed: .cyan.opacity(0.2)
        case nil: isToday ? .orange : .clear
        }
    }
}

#Preview {
    HStack {
        DayCircle(date: .now, status: nil)
        DayCircle(date: .now, status: .learned)
        DayCircle(date: .now, status: .freezed)
    }
    .preferredColorScheme(.dark)
}
