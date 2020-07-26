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
    
    var project: Project!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.projectNameTextField.addTarget(self, action: #selector(textFieldDidChanged(sender:)), for: .editingChanged)
        
        self.doneButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.projectNameTextField.text = self.project.projectName
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }
    
    @IBAction func onTapDoneButton(_ sender: Any) {
        self.project.projectName = self.projectNameTextField.text!
        
        self.projectList.projects.append(project)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapCancelButton(_ sender: Any) {
        print("cancel button")
        
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
