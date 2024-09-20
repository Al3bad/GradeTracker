
//
//  Semester.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 20/9/2024.
//

import Foundation
import SwiftData

@Model
class Semester: Identifiable {
    var id: UUID
    var title: String
    var startDate: Date
    var isComplete: Bool
    var courses: [Course]

    init(id: UUID = UUID(), title: String = "", startDate: Date = Date(), isComplete: Bool = false, courses: [Course] = []) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.isComplete = isComplete
        self.courses = courses
    }
}
