//
//  Project.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/23.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import Foundation

class Project {
    var name: String
    
    var deadline: Date?
    
    var progressRate: Int {
        get {
            if self.allTaskNumber == 0 {
                return 0
            } else {
                return finishedTaskNumber / allTaskNumber * 100
            }
        }
    }
    
    var allTaskNumber: Int {
        get {
            return self.tasks.count
        }
    }
    
    var finishedTaskNumber: Int {
        get {
            var count = 0
            
            for task in self.tasks {
                if task.isFinished {
                    count += 1
                }
            }
            
            return count
        }
    }
    
    var tasks: [Task] = []
    
    
    init(name: String) {
        self.name = name
        self.deadline = Date()
    }
    
    func move(from sourceIndex: Int, to destinationIndex: Int) {
        let task = self.tasks[sourceIndex]
        
        self.tasks.remove(at: sourceIndex)
        self.tasks.insert(task, at: destinationIndex)
    }
}
