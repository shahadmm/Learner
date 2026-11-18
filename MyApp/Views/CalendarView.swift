//
//  CalendarView.swift
//  MyApp
//
//  Created by shahad almaghrabi on 08/06/1448 AH.
//
import SwiftUI

struct CalendarView: View {
    @State private var viewModel = CalendarViewModel()

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                ForEach(viewModel.months) { month in
                    VStack(alignment: .leading, spacing: 12) {
                        Text(month.title)
                            .font(.headline)

                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(viewModel.weekdayNames, id: \.self) { name in
                                Text(name)
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            }

                            ForEach(0..<month.emptyDays, id: \.self) { _ in
                                Color.clear
                            }

                            ForEach(month.days, id: \.self) { day in
                                DayCircle(date: day, status: viewModel.status(on: day))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Activities")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CalendarView()
    }
    .preferredColorScheme(.dark)
}
