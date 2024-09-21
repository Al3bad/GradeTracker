//
//  CourseView.swift
//  GradeTracker
//
//  Created by Abdullah Alabbad on 21/9/2024.
//

import SwiftUI
import SwiftData

struct CourseView: View {
    
    @Query var assignments: [Assignment]
    
    @State private var showingSheet = false
    
    var body: some View {
        List {
            Section {
                CourseSummaryCardView(goal: 50, assignments: assignments)
            }
            
            Section(header: HStack {
                Text("Assignment")
                Spacer()
                Button("", systemImage: "plus") {
                    showingSheet.toggle()
                }
                .padding(.bottom, 5)
            }) {
                ForEach(assignments) { assignment in
                    HStack {
                        Text(assignment.title)
                        Spacer()
                        HStack {
                            if (assignment.mark != nil) {
                                Text(assignment.mark!.truncated)
                                    .foregroundStyle(Color(red: 58/255, green: 175/255, blue: 88/255))
                            } else {
                                Text("-")
                                    .foregroundStyle(.secondary)
                            }
                            Text("/")
                                .foregroundStyle(.secondary)
                            Text(assignment.weight.truncated)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            NewAssignmentSheetView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    NavigationStack {
        CourseView()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Course Info")
                        .font(.title)
                        .bold()
                }
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        Text("Edit Course Info Screen")
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
    }
    .modelContainer(for: [Assignment.self])
}
