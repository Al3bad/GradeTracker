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
    @State private var selectedSemester: Semester?
    @State private var showingSheet = false
    
    var body: some View {
        VStack{
            
            NavigationStack {
                HStack{
                    SemesterPickingView(selectedSemester: $selectedSemester)
                        .toolbar {
                            ToolbarItem(placement: .navigation) {
                                Text("Semester Info")
                                    .font(.title)
                                    .bold()
                            }
                            ToolbarItem(placement: .primaryAction) {
                                NavigationLink {
                                    AddSemesterView()
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                }
                if (selectedSemester != nil) {
                    CoursesListingView(semester: $selectedSemester)
                }
                
                
            }
            .sheet(isPresented: $showingSheet) {
                AddCourseView(selectedSemester: $selectedSemester)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Semester.self, Course.self, configurations: config)
        
        return ContentView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container: \(error)")
    }
}
//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Semester.self, configurations: config)
//
//        return SemesterPickingView(selectedSemester: .constant(nil))
//            .modelContainer(container)
//    } catch {
//        fatalError("Failed to create model container: \(error)")
//    }
//}

