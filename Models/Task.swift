//
//  Task.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/23.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import Foundation

class Task: Identifiable {
    var id = UUID()
    var name: String
    var deadline: Date = Date()
    var isFinished: Bool = false
    
    init(name: String) {
        self.name = name
    }
}
