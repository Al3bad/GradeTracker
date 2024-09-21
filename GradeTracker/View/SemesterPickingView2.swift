//
//  SemesterPickingView2.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 21/9/2024.
//

import SwiftUI
import SwiftData

struct SemesterPickingView: View {
    @Environment(\.modelContext) var modelContext
    //    @State private var semesters: [Semester] = [
    //        Semester(title: "Fall 2023"),
    //        Semester(title: "Spring 2024"),
    //        Semester(title: "Summer 2024")
    //    ]
    @Query var semesters: [Semester]
    
    @Binding var selectedSemester: Semester?
    
    var body: some View {
        HStack{
            VStack {
                Picker("Select a Semester", selection: $selectedSemester) {
                    ForEach(semesters) { semester in
                        Text(semester.title).tag(semester as Semester?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                if semesters.isEmpty {
                    Text("Please add a semester.")
                        .foregroundColor(.red)
                } else {
                    if selectedSemester == nil {
                        Text("Please select a semester.")
                            .foregroundColor(.gray)
                    } else {
                        Text("Selected: \(selectedSemester?.title ?? "")")
                    }
                }
            }
//            .padding(.trailing, 25)
//            .padding()
            
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Semester.self, configurations: config)
        
        return SemesterPickingView(selectedSemester: .constant(nil))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container: \(error)")
    }
}
