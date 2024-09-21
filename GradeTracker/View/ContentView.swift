//
//  ContentView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Course]()

    var body: some View {
        NavigationStack(path: $path){
            CoursesListingView()
                .navigationTitle("Courses")
                .toolbar{
                    Button("Add Courses", systemImage: "plus", action: AddCourse)
                }
        }
    }
    
    func AddCourse(){
        let course = Course()
        modelContext.insert(course)
        path = [course]
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Course.self)
}
