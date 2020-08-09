//
//  ProjectsList.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/23.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import Foundation

class ProjectsList {
    
    static let shared = ProjectsList()
    
    var projects: [Project] = []
    
    
    private init() {
        let project = Project(name: "Test")
        
        let task = Task(name: "ToDo")
        task.deadline = Date()
        
        project.tasks.append(task)
        
        let task2 = Task(name: "Test")
        task2.deadline = Date()
        
        project.tasks.append(task2)
        
        self.projects.append(project)
    }
}
