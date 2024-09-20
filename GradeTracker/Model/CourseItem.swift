//
//  CourseItem.swift
//  GradeTracker
//
//  Created by Kin Lok Chan on 20/9/2024.
//

import Foundation
import SwiftData

@Model
class Course: Identifiable {
    var id: UUID
    var title: String
    var credits: Int
    var goal: Double? // Optional to set the goal

    init(id: UUID = UUID(), title: String = "", credits: Int = 0, goal: Double? = nil) {
        self.id = id
        self.title = title
        self.credits = credits
        self.goal = goal
    }
}
