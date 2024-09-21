//
//  HomeView.swift
//  GradeTracker
//
//  Created by Mao Mingjian on 20/9/2024.
//

import SwiftUI
import SwiftData

struct CoursesListingView: View {
    @Query var courses: [Course]
    
    var body: some View {
        List (courses){ course in
            NavigationLink {
                NavigationStack{
                    CourseView(course: course)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                NavigationLink {
                                    EditCourseView(course: course)
                                } label: {
                                    Image(systemName: "square.and.pencil")
                                }
                            }
                    
                        }
                        .navigationTitle(course.title)
                }
            } label: {
                let totalMark = course.assignments.reduce(0) { $0 + ($1.mark ?? 0) }
                let totalWeight = course.assignments.reduce(0) { $0 + $1.weight }
                let totalWeight2 = totalWeight < 100 ? 100 : totalWeight

                RowView(item: course.title, rightView: ProgressDonutChart(current: totalMark, total: totalWeight2))
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
