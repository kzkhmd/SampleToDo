//
//  TaskCell.swift
//  SampleToDoSwiftUI
//
//  Created by Kazuki Hamada on 2020/11/03.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import SwiftUI

struct TaskCell: View {
    var task: Task
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.name)
                    .font(.title2)
                
                Text(dateFormatter.string(from: task.deadline))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task(name: "Test"))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
