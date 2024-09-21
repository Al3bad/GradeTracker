//
//  RowView.swift
//  GradeTracker
//
//  Created by Mao Mingjian on 20/9/2024.
//

import SwiftUI

struct RowView: View {
//    var item:
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Course Name")
            }
            
            Spacer()
            VStack(alignment: .trailing){
                Text("Remaining")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                Text("Card")
            }
        }
        .padding()
    }
}

#Preview {
    RowView()
}
