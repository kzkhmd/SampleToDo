//
//  Task.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/23.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import Foundation

struct Task {
    var taskName: String
    var deadline: Date?
    var isFinished: Bool = false
    
    init(taskName: String) {
        self.taskName = taskName
    }
}
