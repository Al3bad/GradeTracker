//
//  HomeView.swift
//  GradeTracker
//
//  Created by Mao Mingjian on 20/9/2024.
//

import SwiftUI
import SwiftData

struct CoursesListingView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var courses: [Course]
    
    var body: some View {
        List (courses){ course in
            NavigationLink {
                CourseView(course: course)
            } label: {
                let totalMark = course.assignments.reduce(0) { $0 + ($1.mark ?? 0) }
                let totalWeight = course.assignments.reduce(0) { $0 + $1.weight }
                
                RowView(item: course.title, rightView: ProgressDonutChart(current: totalMark, total: totalWeight))
            }
        }
    }
    
}



#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Course.self, configurations: config)
        return CoursesListingView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
