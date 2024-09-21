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
        List {
            ForEach(courses) { course in
                NavigationLink(value: course) {
                    RowView(item: course)
                    }
                }
            }
        }

}



#Preview {
    CoursesListingView()
}
