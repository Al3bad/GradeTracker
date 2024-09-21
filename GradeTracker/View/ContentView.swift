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
//    @State private var showLandingView = true
//    var body: some View {
//        ZStack{
//            if showLandingView {
//                LandingView()
//            } else {
//                DummyView()
//            }
//        }
//        .onAppear {
//            // Set up a delay before switching views
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                withAnimation {
//                    showLandingView = false
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Course.self)
}

struct DummyView: View{
    var body: some View{
        Text("Dummy")
    }
}
