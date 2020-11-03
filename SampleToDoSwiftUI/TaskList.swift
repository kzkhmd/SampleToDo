//
//  TaskList.swift
//  SampleToDoSwiftUI
//
//  Created by Kazuki Hamada on 2020/11/03.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import SwiftUI

struct TaskList: View {
    @State var tasks: [Task]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tasks) { task in
                    TaskCell(task: task)
                        .frame(height: 60)
                }
                .onDelete(perform: remove)
            }
            .navigationBarTitle(Text("Tasks"))
//            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func remove(at index: IndexSet) {
        tasks.remove(atOffsets: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let projectList = ProjectsList.shared
        
        TaskList(tasks: projectList.projects[0].tasks)
    }
}
