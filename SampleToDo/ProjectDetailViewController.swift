//
//  ProjectDetailViewController.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/26.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import UIKit


class ProjectDetailViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var projectNameTextField: UITextField!
    
    private var projectList = ProjectsList.shared
    
    var project: Project?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.projectNameTextField.addTarget(self, action: #selector(textFieldDidChanged(sender:)), for: .editingChanged)
        
        self.doneButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let project = self.project {
            self.projectNameTextField.text = project.name
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }
    
    @IBAction func onTapDoneButton(_ sender: Any) {
        if let project = self.project {
            project.name = self.projectNameTextField.text!
        } else {
            self.projectList.projects.append( Project(name: self.projectNameTextField.text!) )
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension ProjectDetailViewController {
    
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


extension ProjectDetailViewController: UITextFieldDelegate {
    
    
}
