//
//  TaskList.swift
//  SampleToDoSwiftUI
//
//  Created by Kazuki Hamada on 2020/11/03.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import SwiftUI

struct TaskList: View {
    var tasks: [Task] {
        let projectList = ProjectsList.shared
        
        return projectList.projects[0].tasks
    }
    
    var body: some View {
        List {
            ForEach(self.tasks) { task in
                TaskCell(task: task)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
