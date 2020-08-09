//
//  TaskDetailViewController.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/08/02.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var taskName: UITextField!
    
    var project: Project!
    
    var task: Task?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskName.addTarget(self, action: #selector(textFieldDidChanged(sender:)), for: .editingChanged)
        
        self.doneButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let task = self.task {
            self.taskName.text = task.name
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }
    
    @IBAction func onTapDoneButton(_ sender: Any) {
        if let task = self.task {
            task.name = self.taskName.text!
        } else {
            self.project.tasks.append( Task(name: self.taskName.text!) )
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension TaskDetailViewController {
    
    @objc func textFieldDidChanged(sender: UITextField) {
        guard let text = sender.text else {
            return
        }
        
        if text.isEmpty {
            self.doneButton.isEnabled = false
        } else {
            self.doneButton.isEnabled = true
        }
    }
    
}
