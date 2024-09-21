//
//  ContentView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 20/9/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack{
            CoursesListingView()
                .navigationTitle("Courses")
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        NavigationLink {
                            AddCourseView()
                                .navigationBarBackButtonHidden(true)
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
        }
}

#Preview {
    ContentView()
        .modelContainer(for: Course.self)
}
