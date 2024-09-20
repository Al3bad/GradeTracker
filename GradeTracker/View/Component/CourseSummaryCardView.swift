//
//  CourseSummaryCardView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import SwiftUI

struct Assignment {
    var title: String
    var weight: Double
    var mark: Double
}

struct CourseSummaryCardView: View {
    
    var goal: Double
    var assignments: [Assignment]
    
    var body: some View {
        let totalMark = assignments.reduce(0) { $0 + $1.mark }
        let totalWeight = assignments.reduce(0) { $0 + $1.weight }
        let remaining = goal - totalMark
        
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading) {
                        Text("Gained marks")
                            .bold()
                        HStack {
                            Text("\(totalMark.truncated)%")
                            Text("/")
                            Text("\(totalWeight.truncated)%")
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Target")
                            .bold()
                        HStack {
                            Text("\(goal.truncated)%")
                        }
                    }
                }
                Spacer()
                ProgressDonutChart(current: totalMark, total: totalWeight, mark: goal)
                    .frame(maxWidth: 164)
            }
            if remaining > 0 {
                Text("\(remaining.truncated)% marks remainting to reach your target")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                    .padding()
            }
            else {
                Text("Congrats! You've reached your target marks")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                    .padding()
            }
        }
        .padding()
    }
    
    func mapPercentageToDegree(value: Double) -> Double {
        // Ensure the value is clamped between 0 and 100
        let clampedValue = min(max(value, 0), 100)
        
        // Map the value to degrees
        return (clampedValue / 100) * 360
    }

}

#Preview {
    CourseSummaryCardView(goal: 80, assignments: [
        .init(title: "Assignment 1", weight: 50, mark: 30.31),
        .init(title: "Assignment 2", weight: 50, mark: 30)
    ])
}

#Preview {
    CourseSummaryCardView(goal: 80, assignments: [
        .init(title: "Assignment 1", weight: 50, mark: 60.31),
        .init(title: "Assignment 2", weight: 50, mark: 30)
    ])
}
